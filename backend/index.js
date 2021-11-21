const express = require('express')
const { router } = require('./src/routes/router')
const cors = require('cors')

const server = express()
server.use(cors())
router(server)

server.listen(3000, () => {
  console.log('Server is running on port 3000')
})
