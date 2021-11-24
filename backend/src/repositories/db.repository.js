exports.dbRepository = ({ dbConnection }) => ({
  execute ({ query, values, order, filter }) {
    let newQuery = query
    if (order) {
      newQuery = this.concatOrder(query, order)
    }

    if (filter) {
      newQuery = this.concatFilter(query, filter)
    }
    return dbConnection.query({ query: newQuery, values })
  },

  concatOrder (query, order) {
    return `${query} ORDER BY ${order.col} ${order.direction}`
  },

  concatFilter (query, filter) {
    return `${query} WHERE LOWER(${filter.col}) LIKE LOWER(%${filter.value}%)`
  }
})
