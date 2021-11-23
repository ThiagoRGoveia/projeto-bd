import candidacies from "./candidacies"
import crime_free_candidates from "./crime_free_candidates"
import donations from "./donations"
import elected from "./elected"
import suits from "./suits"
import support_teams from "./support_teams"
const columns = {
  list_candidacy: candidacies,
  list_donations: donations,
  list_suits: suits,
  list_elected: elected,
  list_support_teams: support_teams,
  list_crime_free_candidates: crime_free_candidates
}

export default (column) => {
  return columns[column]
}