// const { controller } = require("../controller/controller");

const { controllerFactory } = require("../controller/controller.factory");

exports.routes = [
    {
        method: 'get',
        handler: controllerFactory({method: 'home'}),
        route: '/'
    },
    // {
    //     method: 'get',
    //     handler: controller({repository}).home,
    //     route: '/novarota'
    // }
]