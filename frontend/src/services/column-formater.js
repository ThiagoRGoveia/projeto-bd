import { format } from 'date-fns'

const formatMethods = {
  datanasc: (date) => {
    return format(new Date(date), 'dd/MM/yyyy')
  }
}

export default (column, value) => {
  if (formatMethods[column]) {
    return formatMethods[column](value)
  }

  return value
}