// const { controller } = require("../controller/controller");

const { controllerFactory } = require('../controller/controller.factory')

exports.routes = [
  {
    method: 'get',
    handler: controllerFactory({ method: 'query' }),
    route: '/query'
  }
  // {
  //     method: 'get',
  //     handler: controller({repository}).home,
  //     route: '/novarota'
  // }
]
