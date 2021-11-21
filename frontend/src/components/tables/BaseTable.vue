<template>
  <div>
    <b-table :data="data" paginated :per-page="20" >
      <b-table-column
        v-for="column in columns"
        :key="column.name"
        :field="column.name"
        :label="column.label"
        v-slot="props"
        sortable
      >
        {{ $columnFormater(column.name, props.row[column.name]) }}
      </b-table-column>
      <b-table-column>
        <b-button
          type="is-danger"
          icon-right="delete"
          @click="handleDelete(row.id)"
        />
      </b-table-column>

    </b-table>
  </div>
</template>

<script>
import aluno from './columns/aluno'

export default {
  name: 'BaseTable',
  props: ['entity'],
  data () {
    return {
      data: [],
      columns: aluno
    }
  },
  methods: {
    handleDelete(id) {
      this.$http.delete(`/delete/${this.entity}/${id}`).then(
        this.row = this.row.filter(row => row.id !== id)
      )
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
