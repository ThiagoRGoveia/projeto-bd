import { format } from 'date-fns'
const formatMethods = {}

formatMethods.julgamento = (date) => {
  return format(new Date(date), 'dd/MM/yyyy')
},
formatMethods.validade = formatMethods.julgamento,
formatMethods.foi_eleito = (value) => {
  return value ? 'Sim' : 'Não'
}
formatMethods.valor_doado = (value) => {
  return value ? value : 0
}

export default (column, value) => {
  if (formatMethods[column]) {
    return formatMethods[column](value)
  }

  return value
}