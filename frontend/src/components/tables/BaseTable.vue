<template>
  <div>
    <b-field grouped>
      <b-field>
        <b-select
        v-model="table"
        placeholder="Selecione uma tabela"
        >
          <option
            v-for="option in tableOptions"
            :value="option.table"
            :key="option.table"
          >
            {{ option.label }}
          </option>
        </b-select>
      </b-field>
      <b-field>
        <b-select
          v-model="query.filter.col"
          placeholder="Selecione um filtro"
        >
          <option
            v-for="option in filterOptions"
            :value="option.name"
            :key="option.name"
          >
            {{ option.label }}
          </option>
        </b-select>
      </b-field>
      <b-field>
        <b-input placeholder="Busque um campo" v-model="query.filter.value" />
      </b-field>
      <b-field>
        <b-button
          type="is-primary"
          icon-right="magnify"
          @click="handleFilter"
        />
      </b-field>
      <b-field>
        <b-button
          type="is-primary"
          @click="handleClear"
        >
        Limpar
        </b-button>
      </b-field>
    </b-field>
    <br>
    <b-table
      :data="data"
      paginated
      :per-page="10"
      @sort="handleSort"
      backend-sorting
    >
      <b-table-column
        v-for="column in columns"
        :key="column.name"
        :field="column.name"
        :label="column.label"
        v-slot="props"
        sortable
        centered
      >
        {{ $columnFormater(column.name, props.row[column.name]) }}
      </b-table-column>
      <b-table-column
        v-slot="props"
       label="Deletar"
       centered
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
  data () {
    return {
      data: [],
      columns: [],
      table: 'candidacy',
      filterOptions: getColumns('candidacy'),
      query: {
        table: 'candidacy',
        filter: {
          col: undefined,
          value: undefined
        },
        sort: {
          col: undefined,
          order: undefined
        }
      },
      tableOptions: [
        {table: 'candidacy', label: 'Candidaturas'},
        {table: 'candidates', label: 'Candidatos'},
        {table: 'donations', label: 'Doações'},
        {table: 'suits', label: 'Processos Judiciais'},
        {table: 'elected', label: 'Eleitos'},
        {table: 'support_teams', label: 'Equipes de apoio'},
        {table: 'crime_free_candidates', label: 'Candidatos ficha limpa'},
        {table: 'parties', label: 'Partidos'},
        {table: 'positions', label: 'Cargos'},
        {table: 'elections', label: 'Pleitos'},
        {table: 'individuals', label: 'Individuos'},
      ]
    }
  },
  methods: {
    makeRequest() {
      let query = `/query?query=list_${this.table}`
      if (this.query.filter.col) {
        query += `&filter[]=${this.query.filter.col}&filter[]=${this.query.filter.value}`
      }
      if (this.query.sort.col) {
        query += `&sort[]=${this.query.sort.col}&sort[]=${this.query.sort.order}`
      }
      this.$http.get(query).then(({data}) =>{
          this.data = data
        })
    },
    handleClear () {
      this.query.filter = {}
      this.query.sort = {}
      this.makeRequest()
    },
    handleSort(column, order) {
      this.query.sort = {
        col: column,
        order: order
      }
      this.makeRequest()
    },
    handleDelete(id) {
      this.$http.get(`/query?query=delete_${this.table}&params[]=${id}`).then(
        this.data = this.data.filter(row => row.id !== id)
      )
    },
    handleFilter() {
      this.makeRequest()
    }
  },
  watch: {
    table() {
      this.$http.get(`/query?query=list_${this.table}`).then(({data}) =>{
          this.data = data
          this.columns = getColumns(this.table)
          this.filterOptions = getColumns(this.table)
          this.query.filter.col = undefined
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
