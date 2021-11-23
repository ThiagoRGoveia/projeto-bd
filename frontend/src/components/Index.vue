<template>
  <div class="table-container">
    <div class="container">
      <b-select
        v-model="selectedTable"
        placeholder="Selecione uma tabela"
      >
        <option
          v-for="option in options"
          :value="option.table"
          :key="option.table"
        >
          {{ option.label }}
        </option>
      </b-select>
      <br>
      <BaseTable :table="selectedTable" />
    </div>
  </div>
</template>

<script>
import BaseTable from './tables/BaseTable.vue'
export default {
  name: 'Index',
  data() {
    return {
      selectedTable: 'list_candidacy',
      options: [
        {table: 'candidacy', label: 'Candidaturas'},
        {table: 'donations', label: 'Doações'},
        {table: 'suits', label: 'Processos Judiciais'},
        {table: 'elected', label: 'Eleitos'},
        {table: 'support_teams', label: 'Equipes de apoio'},
        {table: 'crime_free_candidates', label: 'Candidatos ficha limpa'},
        {table: 'parties', label: 'Partidos'},
        {table: 'positions', label: 'Cargos'},
        {table: 'elections', label: 'Pleitos'},
      ]
    }
  },
  components: {
    BaseTable
  }
}
</script>
<style>
  .table-container {
    margin-top: 80px;
    margin-bottom: 100px;
  }
  .table-container > .container {
    overflow-x: hidden;
  }
</style>
