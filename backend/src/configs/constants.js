require('dotenv').config()

const postgresConfig = {
  host: process.env.DB_URL,
  port: process.env.DB_PORT,
  database: process.env.DB_DATABASE,
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  max: process.env.DB_MAX_POOL_CONNECTIONS,
  idleTimeoutMillis: process.env.DB_MAX_IDLE_TIMEOUTS_IN_MILIS,
  connectionTimeoutMillis:
    process.env.DB_MAX_CONNECTION_TIMEOUTS_IN_MILIS
}

exports.postgresConfig = Object.freeze(postgresConfig)
