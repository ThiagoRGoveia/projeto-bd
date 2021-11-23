const fs = require('fs')
exports.loadQueries = () => ({
  // filter_candidacy: fs.readFileSync('src/queries/filter-candidaturas.sql').toString(),
  list_candidacy: fs.readFileSync('src/queries/listagem-candidaturas.sql').toString(),
  list_donations: fs.readFileSync('src/queries/listagem-doacoes.sql').toString(),
  list_suits: fs.readFileSync('src/queries/listagem-processos.sql').toString(),
  list_elected: fs.readFileSync('src/queries/listagem-eleitos.sql').toString(),
  list_support_teams: fs.readFileSync('src/queries/listagem-equipes-apoio.sql').toString(),
  list_crime_free_candidates: fs.readFileSync('src/queries/listagem-candidatos-ficha-limpa.sql').toString(),
  list_parties: fs.readFileSync('src/queries/listagem-partidos.sql').toString(),

  list_positions: fs.readFileSync('src/queries/listagem-cargos.sql').toString(),
  list_elections: fs.readFileSync('src/queries/listagem-pleitos.sql').toString(),

  delete_candidacy: fs.readFileSync('src/dml/delete-candidatura.sql').toString(),
  delete_donations: fs.readFileSync('src/dml/delete-doacao.sql').toString(),
  delete_suits: fs.readFileSync('src/dml/delete-processo.sql').toString(),
  delete_elected: fs.readFileSync('src/dml/delete-candidatura.sql').toString(),
  delete_support_teams: fs.readFileSync('src/dml/delete-equipe-apoio.sql').toString(),
  delete_crime_free_candidates: fs.readFileSync('src/dml/delete-candidato.sql').toString(),
  delete_parties: fs.readFileSync('src/dml/delete-partido.sql').toString(),
  delete_positions: fs.readFileSync('src/dml/delete-cargo.sql').toString(),
  delete_elections: fs.readFileSync('src/dml/delete-pleito.sql').toString()
})
