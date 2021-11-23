<template>
  <div>
    <b-table :data="data" paginated :per-page="10" >
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
      <b-table-column
        v-slot="props"
       label="Deletar"
      >
        <b-button
          type="is-danger"
          icon-right="delete"
          @click="handleDelete(props.row.id)"
        />
      </b-table-column>

    </b-table>
  </div>
</template>

<script>
import getColumns from './columns/index'

export default {
  name: 'BaseTable',
  props: ['table'],
  data () {
    return {
      data: [],
      columns: []
    }
  },
  methods: {
    handleDelete(id) {
      this.$http.get(`/query?query=delete_${this.table}&params[]=${id}`).then(
        this.row = this.row.filter(row => row.id !== id)
      )
    }
  },
  watch: {
    table() {
    this.$http.get(`/query?query=list_${this.table}`).then(({data}) =>{
        this.data = data
        this.columns = getColumns(this.table)
      })
    }
  },
  created () {
      this.$http.get(`/query?query=list_${this.table}`).then(({data}) =>{
        if (data) {
          this.data = data
          this.columns = getColumns(this.table)
        }
      })
  }
}
</script>

<style scoped>

</style>
