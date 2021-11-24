exports.dbRepository = ({ dbConnection }) => ({
  execute ({ query, values, order, filter }) {
    let newQuery = query
    if (filter) {
      newQuery = this.concatFilter(newQuery, filter)
    }
    if (order) {
      newQuery = this.concatOrder(newQuery, order)
    }
    return dbConnection.query({ query: newQuery, values })
  },

  concatOrder (query, order) {
    return `${query} ORDER BY ${order.col} ${order.direction}`
  },

  concatFilter (query, filter) {
    return `${query} WHERE LOWER(CAST(${filter.col} AS varchar)) LIKE LOWER('%${filter.value}%')`
  }
})
