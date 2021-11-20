<template>
  <div>
    <b-table :data="data">
      <b-table-column
        v-for="column in columns"
        :key="column.name"
        :field="column.name"
        :label="column.label"
        v-slot="props"
      >
        {{ $columnFormater(column.name, props.row[column.name]) }}
      </b-table-column>
      <b-table-column>
        <b-button
          type="is-danger"
          icon-right="delete"
        />
      </b-table-column>

    </b-table>
  </div>
</template>

<script>
import aluno from './columns/aluno'

export default {
  name: 'BaseTable',
  data () {
    return {
      data: [],
      columns: aluno
    }
  },
  created () {
    this.$http.get('/query?query=first').then(({data}) =>{
      console.log(data)
      this.data = data
    })
  }
}
</script>

<style scoped>

</style>
