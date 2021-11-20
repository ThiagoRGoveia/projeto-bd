const fs = require('fs')
exports.loadQueries = () => ({
  first: fs.readFileSync('backend/src/queries/buscar-algo.sql').toString()
})
