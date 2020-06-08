import './styles/index.css'

import { checkFormValidity, getFormValues, toCurrency, getElementsObjectByID } from './utils'
import { getTotalValue, getInstallmentValue } from './domain'
import { loanService } from './services'
import constants from './constants'

export const handleChangeForm = elements => {
  const totalValue = getTotalValue({ installments: elements.installments.value, loanAmount: elements.loanvalue.value })
  const installmentValue = getInstallmentValue({ installments: elements.installments.value, totalValue })
  elements.totalvalue.innerHTML = toCurrency({ value: totalValue })
  elements.installmentvalue.innerHTML = toCurrency({ value: installmentValue })
  elements.taxvalue.innerHTML = `${toCurrency({ value: constants.tax * 100 })}%`
}

export const handleChangeWarrantyType = (elements, event) => {
  elements.loanvalue.value = constants[event.target.value].min
  elements.loanvaluerange.min = constants[event.target.value].min
  elements.loanvaluerange.value = constants[event.target.value].min
  elements.loanvaluerange.max = constants[event.target.value].max
  elements.rangestart.innerHTML = toCurrency({ value: constants[event.target.value].min })
  elements.rangeend.innerHTML = toCurrency({ value: constants[event.target.value].max })
  elements.installments.innerHTML = constants[event.target.value].installments.map(i => `<option value=${i}>${i}</option>`).join('')
}

export const submitForm = (event, formElement) => {
  event.preventDefault()

  checkFormValidity(formElement)
  loanService.create(getFormValues(formElement))
    .then(result => window.confirm(result, 'Your form submited success'))
    .catch(error => window.alert('Your form submited error', error))
}

export const CreditasChallenge = (() => {
  const registerEvents = () => {
    const formElement = document.getElementById('form')
    const elements = getElementsObjectByID(document.querySelectorAll('form *'))

    elements.warrantyvaluerange.addEventListener('input', event => (elements.warrantyvalue.value = event.target.value))
    elements.loanvaluerange.addEventListener('input', event => (elements.loanvalue.value = event.target.value))

    elements.warrantyvalue.addEventListener('input', event => (elements.warrantyvaluerange.value = event.target.value))
    elements.loanvalue.addEventListener('input', event => (elements.loanvaluerange.value = event.target.value))

    formElement.addEventListener('change', () => handleChangeForm(elements))
    formElement.addEventListener('submit', event => submitForm(event, formElement))

    elements.warrantytype.addEventListener('change', event => handleChangeWarrantyType(elements, event))

    handleChangeForm(elements)
  }

  return {
    initialize () {
      registerEvents()
    }
  }
})()
