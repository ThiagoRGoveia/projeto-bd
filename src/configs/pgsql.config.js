const { Pool } = require('pg')
const { postgresConfig } = require('./constants')

class PgConnection {
  constructor () {
    this.poolInstance = new Pool(postgresConfig)
    this.poolInstance.on('error', (error) => {
      console.error(`[POSTGRES] ${error.message}`)
    })
  }

  async query ({ query, values }) {
    let connection
    try {
      connection = await this.poolInstance.connect()
      const { rows: result } = await connection.query(query, values)
      return result
    } catch (e) {
        console.log(e)
    } finally {
      if (connection) {
        connection.release()
      }
    }
  }
}
exports.PgConnection = new PgConnection()