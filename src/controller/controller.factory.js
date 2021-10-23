const { repository } = require("../repositories/repository");
const { controller } = require("./controller");

const controllerFactory = ({method}) => {
    return controller({repository})[method]
}

exports.controllerFactory = controllerFactory