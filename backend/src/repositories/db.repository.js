exports.dbRepository = ({ dbConnection }) => ({
  execute (query, values) {
    return dbConnection.query({ query, values })
  }
})
