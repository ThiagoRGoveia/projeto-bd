const { PgConnection } = require("./src/configs/pgsql.config");

const posg = PgConnection

async function test() {
    return await posg.query({query: "select * from aluno"})
}

test().then(res => {
    console.log(res)
})