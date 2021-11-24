<template>
  <div class="table-container">
    <div class="container">
      <BaseTable />
    </div>
  </div>
</template>

<script>
import BaseTable from './tables/BaseTable.vue'
export default {
  name: 'Index',
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
