import candidacies from "./candidacies"
import crime_free_candidates from "./crime_free_candidates"
import donations from "./donations"
import elected from "./elected"
import elections from "./elections"
import individual from "./individual"
import parties from "./parties"
import positions from "./positions"
import suits from "./suits"
import support_teams from "./support_teams"
const columns = {
  candidacy: candidacies,
  donations: donations,
  suits: suits,
  elected: elected,
  support_teams: support_teams,
  crime_free_candidates: crime_free_candidates,
  parties: parties,
  positions: positions,
  elections: elections,
  individuals: individual,
}

export default (column) => {
  return columns[column]
}