import constants from '../constants'

const toCurrency = ({ value = 0, withSymbol = false, numDecimal = 2 } = {}) => {
  const defaultOptions = { minimumFractionDigits: 2, maximumFractionDigits: numDecimal }
  const symbolOptions = withSymbol ? { style: 'currency', currency: 'BRL' } : {}
  return Number(value).toLocaleString('pt-BR', { ...defaultOptions, ...symbolOptions })
}

const toStringValues = (values, totalValue) =>
  `CONFIRMAÇÃO\n\n${values
    .map(value => constants[value.field] && `${constants[value.field]}: ${value.value}`)
    .filter(value => value !== '')
    .join('\n')}`.concat(`\nTotal ${totalValue}`)

const checkFormValidity = formElement => formElement.checkValidity()

const getFormValues = formElement =>
  Object.values(formElement.elements)
    .filter(element => ['SELECT', 'INPUT'].includes(element.nodeName))
    .map(element => ({
      field: element.name,
      value: element.value
    }))

const getElementsObjectByID = body => (
  [...body]
    .filter(el => el.id)
    .map(item => ({ [item.id]: item }))
    .reduce((a, b) => ({ ...a, ...b }), {}))

export {
  toCurrency,
  toStringValues,
  checkFormValidity,
  getFormValues,
  getElementsObjectByID
}
