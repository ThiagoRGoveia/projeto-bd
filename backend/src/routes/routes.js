// const { controller } = require("../controller/controller");

const { controllerFactory } = require('../controller/controller.factory')

exports.routes = [
  {
    method: 'get',
    handler: controllerFactory({ method: 'query' }),
    route: '/query'
  }
]
