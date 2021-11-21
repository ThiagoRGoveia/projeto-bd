const { dbRepository } = require('../repositories/db.repository')
const { controller } = require('./controller')
const { loadQueries } = require('../queries/query-loader')
const { PgConnection } = require('../configs/pgsql.config')

const controllerFactory = ({ method }) => {
  return controller({
    repository: dbRepository({ dbConnection: PgConnection }),
    loadQueries: loadQueries()
  })[method]
}

exports.controllerFactory = controllerFactory
