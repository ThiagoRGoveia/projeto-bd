
const {routes} = require('./routes')
exports.router = server => {
    routes.forEach(route => {
        server[route.method](route.route, route.handler)
    })
}