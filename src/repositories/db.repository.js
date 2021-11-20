exports.dbRepository = ({ dbConnection }) => ({
  execute (query) {
    return dbConnection.query({ query })
  }
})
