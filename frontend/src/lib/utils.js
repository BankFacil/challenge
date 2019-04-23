export const warranyOptions = {
  vehicle: {
    minLoan: 3000,
    maxLoan: 100000,
    installments: [24, 36, 48]
  },
  realty: {
    minLoan: 30000,
    maxLoan: 4500000,
    installments: [120, 180, 240]
  }
}

export const setMaxLoan = (value, maxValue) => {
  if (maxLoan(value) > maxValue) {
    return maxValue
  }
  return maxLoan(value)
}

export const currencyFormatter = (number) => new Intl.NumberFormat('pt-BR', {
  style: 'currency',
  currency: 'BRL',
  minimunFractionDigits: 2
}).format(number)

export const replaceDot = (value) => String(value).replace('.', ',')

export const formatValue = (value) => {
  const result = Math.floor(100 * value) / 100
  return replaceDot(result)
}

export const unformatter = (value) => {
  let number = value
  number = number.replace(/\./g, '')
  number = Number((number.split('R$')[1]).replace(',', '.'))
  return number
}

export const calcAmount = (installmentsElement, loanAmountElement) => {
  const IOF = 6.38 / 100
  const INTEREST_RATE = 2.34 / 100
  const TIME = installmentsElement.value / 1000
  const LOAN_AMOUNT = unformatter(loanAmountElement.value)
  return (IOF + INTEREST_RATE + TIME + 1) * LOAN_AMOUNT
}

export const monthlyFee = (installmentValue, loanValue, installments) => Math.floor(
  installmentValue * 1000 / (loanValue / installments)
) / 1000

export const maxLoan = (value) => {
  return value * 0.8
}

export const selectedWarranty = (value) => {
  return warranyOptions[value]
}

export const renderOptions = (selectElement, optionsArray) => {
  var index = 0
  for (index in optionsArray) {
    selectElement.options[index] = new Option(optionsArray[index], optionsArray[index])
  }
}

export const checkFormValidity = formElement => formElement.checkValidity()
