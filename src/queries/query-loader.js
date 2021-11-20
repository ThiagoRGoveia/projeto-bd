const fs = require('fs')

exports.loadQueries = () => ({
  first: fs.readFileSync('src/queries/buscar-algo.sql').toString()
})
