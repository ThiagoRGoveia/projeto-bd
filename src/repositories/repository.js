const { PgConnection } = require("../configs/pgsql.config")

exports.repository = {
    execute(nome, sobrenome) {
        return `<h2>Deu certo</h2><h1>${nome} ${sobrenome}</h1>`
    },
    fetchCompras() {
        const compras = PgConnection.quey({
            query: `SELECT * FROM compras`
        })
        return compras
    }
}