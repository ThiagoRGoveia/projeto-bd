const fs = require('fs')
exports.loadQueries = () => ({
  list_candidacy: fs.readFileSync('src/queries/listagem-candidaturas.sql').toString(),
  filter_candidacy: fs.readFileSync('src/queries/filter-candidaturas.sql').toString(),
  list_donations: fs.readFileSync('src/queries/listagem-doacoes.sql').toString(),
  list_suits: fs.readFileSync('src/queries/listagem-processos.sql').toString(),
  list_elected: fs.readFileSync('src/queries/listagem-eleitos.sql').toString(),
  list_support_teams: fs.readFileSync('src/queries/listagem-equipes-apoio.sql').toString(),
  list_crime_free_candidates: fs.readFileSync('src/queries/listagem-candidatos-ficha-limpa.sql').toString(),
  list_parties: fs.readFileSync('src/queries/listagem-partidos.sql').toString(),
  delete_position: fs.readFileSync('src/dml/delete-cargo.sql').toString(),
  delete_support_team: fs.readFileSync('src/dml/delete-equipe-apoio.sql').toString(),
  delete_individual: fs.readFileSync('src/dml/delete-individuo.sql').toString(),
  delete_party: fs.readFileSync('src/dml/delete-partido.sql').toString(),
  delete_election: fs.readFileSync('src/dml/delete-pleito.sql').toString()
})
