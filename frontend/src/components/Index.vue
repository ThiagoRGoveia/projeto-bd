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
        {table: 'list_candidacy', label: 'Candidaturas'},
        {table: 'list_donations', label: 'Doações'},
        {table: 'list_suits', label: 'Processos Judiciais'},
        {table: 'list_elected', label: 'Eleitos'},
        {table: 'list_support_teams', label: 'Equipes de apoio'},
        {table: 'list_crime_free_candidates', label: 'Candidatos ficha limpa'},
        {table: 'list_parties', label: 'Partidos'},
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
