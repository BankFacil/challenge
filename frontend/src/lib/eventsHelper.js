import * as utils from './utils'

export const changeInstallmentValue = (totalAmountElement, quotaElement, installmentsElement, loanAmountElement, taxElement) => {
  const installmentValue = utils.calcAmount(installmentsElement, loanAmountElement) / installmentsElement.value
  const finalValue = utils.calcAmount(installmentsElement, loanAmountElement)
  taxElement.innerHTML = `${utils.replaceDot(utils.monthlyFee(installmentValue, utils.unformatter(loanAmountElement.value), installmentsElement.value))} %`
  quotaElement.innerHTML = utils.formatValue(installmentValue)
  totalAmountElement.innerHTML = utils.currencyFormatter(finalValue)
}

export const updateMaxValue = (maxValue, rangeElement) => {
  rangeElement.setAttribute('max', maxValue)
  rangeElement.parentNode.children[1].children[1].innerHTML = utils.currencyFormatter(maxValue)
}

export const changeInputElement = (inputElement, rangeElement, minValue, maxValue) => {
  rangeElement.setAttribute('min', minValue)
  rangeElement.value = (maxValue / 2) * 1.25
  rangeElement.parentNode.children[1].children[0].innerHTML = utils.currencyFormatter(minValue)
  updateMaxValue(maxValue, rangeElement)
  inputElement.value = utils.currencyFormatter(rangeElement.value)
}

export const verifyValue = (loanValue, rangeElement) => {
  var realValue = utils.unformatter(loanValue)
  if (realValue < rangeElement.getAttribute('min')) {
    return rangeElement.getAttribute('min')
  }
  if (realValue > rangeElement.getAttribute('max')) {
    return rangeElement.getAttribute('max')
  }
  return realValue
}

export const inputBlur = (inputElement, rangeElement, inputValue) => {
  var realValue = verifyValue(
    inputValue,
    rangeElement
  )
  rangeElement.value = realValue
  inputElement.value = utils.currencyFormatter(realValue)
  return realValue
}

export const getFormValues = formElement =>
  Object.values(formElement.elements)
    .filter(element => ['SELECT', 'INPUT'].includes(element.nodeName))
    .map(element => ({
      field: element.name,
      value: element.value
    }))

export const toStringFormValues = values => {
  const match = matchString => value => value.field === matchString
  const finalValue = utils.calcAmount(values.find(match('parcelas')), values.find(match('valor-emprestimo')))

  return `Confirmação\n${values
    .map(value => `Campo: ${value.field}, Valor: ${value.value}`)
    .join('\n')}`.concat(
    `\nTotal ${utils.currencyFormatter(finalValue)}`
  )
}

export const formatInput = (textInput, inputValue) => {
  textInput.value = 'R$ ' + (inputValue).split('R$ ')[1]
  if ((inputValue).split('R$ ')[1] === 'undefined') {
    textInput.value = 'R$ '
  }
}

export const formatOnBlur = (textInput, rangeInput, inputValue) => {
  var value = inputBlur(
    textInput,
    rangeInput,
    inputValue
  )
  if (isNaN(value)) {
    textInput.value = utils.currencyFormatter(rangeInput.getAttribute('min'))
  }
  return value
}
