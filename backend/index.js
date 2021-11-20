const express = require('express')
const { router } = require('./src/routes/router')

// const { PgConnection } = require("./src/configs/pgsql.config");

const server = express()

router(server)

server.listen(3000, () => {
  console.log('Server is running on port 3000')
})

// PgConnection.query({
//     query: `CREATE TABLE IF NOT EXISTS users (
//         id SERIAL PRIMARY KEY,
//         name VARCHAR(255) NOT NULL,
//         email VARCHAR(255) NOT NULL,
//         password VARCHAR(255) NOT NULL
//     )`
// })
