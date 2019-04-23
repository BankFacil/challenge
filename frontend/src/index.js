import './static/styles.css'
import * as utils from './lib/utils'
import * as helper from './lib/eventsHelper'

export const updateCard = () => {
  helper.changeInstallmentValue(
    document.querySelector('.amount_container p'),
    document.querySelector('.quota span'),
    document.getElementById('parcelas'),
    document.getElementById('valor-emprestimo'),
    document.querySelector('.tax__container p')
  )
}

export const changeOptions = (selectElement, selectedOption) => {
  const loanRange = document.getElementById('valor-emprestimo-range')
  const loanInput = document.getElementById('valor-emprestimo')
  const warrantyRange = document.getElementById('valor-garantia-range')
  const warrantyInput = document.getElementById('valor-garantia')
  utils.renderOptions(selectElement, selectedOption.installments)
  helper.changeInputElement(warrantyInput, warrantyRange, 1.25 * selectedOption.minLoan, 9000000)
  helper.changeInputElement(loanInput, loanRange, selectedOption.minLoan, selectedOption.maxLoan)
}

const resetPage = (selectElement, selectedOption) => {
  changeOptions(selectElement, selectedOption)
  updateCard()
}

export function Send (values) {
  return new Promise((resolve, reject) => {
    try {
      resolve(helper.toStringFormValues(values))
    } catch (error) {
      reject(error)
    }
  })
}

export function Submit (formElement) {
  formElement.addEventListener('submit', function (event) {
    event.preventDefault()
    if (utils.checkFormValidity(formElement)) {
      Send(helper.getFormValues(formElement))
        .then(result => confirm(result, 'Your form submited success'))
        .catch(error => alert('Your form submited error', error))
    }
  })
}

export function handleChangeQuotaValue (
  quotaElement,
  totalAmountElement,
  installmentsElement,
  loanAmountElement,
  taxElement
) {
  installmentsElement.addEventListener('change', function (event) {
    helper.changeInstallmentValue(totalAmountElement, quotaElement, installmentsElement, loanAmountElement, taxElement)
  })
}

export function handleChangeRangeWarranty (
  warrantyRangeElement,
  vehicleWarrantyElement,
  loanAmountRangeElement,
  loanAmountElement,
  warrantyTypeElement
) {
  warrantyRangeElement.addEventListener('change', function (event) {
    const maxValue = utils.setMaxLoan(event.target.value, utils.selectedWarranty(warrantyTypeElement.value).maxLoan)
    helper.updateMaxValue(maxValue, loanAmountRangeElement)
    loanAmountElement.value = utils.currencyFormatter(
      loanAmountRangeElement.value
    )
    vehicleWarrantyElement.value =
      utils.currencyFormatter(Number(event.target.value))
    updateCard()
  })
}

export function handleChangeWarrantyType (
  warrantyElement,
  installmentsElement
) {
  warrantyElement.addEventListener('change', function (event) {
    resetPage(installmentsElement, utils.selectedWarranty(event.target.value))
  })
}

export function handleBlurWarrantyTextInput (
  textInputWarrantyElement,
  rangeWarrantyElement,
  textInputLoanElement,
  rangeLoanElement,
  warrantyTypeElement
) {
  textInputWarrantyElement.addEventListener('input', function (event) {
    helper.formatInput(textInputWarrantyElement, event.target.value)
  })
  textInputWarrantyElement.addEventListener('blur', function (event) {
    var value = helper.formatOnBlur(textInputWarrantyElement, rangeWarrantyElement, event.target.value)
    const maxValue = utils.setMaxLoan(value, utils.selectedWarranty(warrantyTypeElement.value).maxLoan)
    helper.updateMaxValue(maxValue, rangeLoanElement)
    textInputLoanElement.value = utils.currencyFormatter(
      rangeLoanElement.value
    )
    updateCard()
  })
}

export function handleBlurLoanTextInput (
  textInputLoanElement,
  rangeLoanElement
) {
  textInputLoanElement.addEventListener('input', function (event) {
    helper.formatInput(textInputLoanElement, event.target.value)
  })
  textInputLoanElement.addEventListener('blur', function (event) {
    helper.formatOnBlur(textInputLoanElement, rangeLoanElement, event.target.value)
    updateCard()
  })
}

export function handleChangeLoanAmount (
  loanAmountRangeElement,
  loanAmountElement
) {
  loanAmountRangeElement.addEventListener('change', function (event) {
    const newValue = utils.currencyFormatter(Number(event.target.value))
    loanAmountElement.value = newValue
    updateCard()
  })
}

export function handleLoad (
  installmentsElement,
  warrantyElement
) {
  resetPage(
    installmentsElement,
    utils.selectedWarranty(warrantyElement.value)
  )
}

export default class CreditasChallenge {
  static initialize () {
    handleLoad(
      document.getElementById('parcelas'),
      document.getElementById('garantia')
    )
    this.registerEvents()
  }

  static registerEvents () {
    Submit(document.querySelector('.form'))
    handleBlurWarrantyTextInput(
      document.getElementById('valor-garantia'),
      document.getElementById('valor-garantia-range'),
      document.getElementById('valor-emprestimo'),
      document.getElementById('valor-emprestimo-range'),
      document.getElementById('garantia')
    )
    handleBlurLoanTextInput(
      document.getElementById('valor-emprestimo'),
      document.getElementById('valor-emprestimo-range')
    )
    handleChangeWarrantyType(
      document.getElementById('garantia'),
      document.getElementById('parcelas')
    )
    handleChangeQuotaValue(
      document.querySelector('.quota span'),
      document.querySelector('.amount_container p'),
      document.getElementById('parcelas'),
      document.getElementById('valor-emprestimo'),
      document.querySelector('.tax__container p')
    )

    handleChangeRangeWarranty(
      document.getElementById('valor-garantia-range'),
      document.getElementById('valor-garantia'),
      document.getElementById('valor-emprestimo-range'),
      document.getElementById('valor-emprestimo'),
      document.getElementById('garantia')
    )

    handleChangeLoanAmount(
      document.getElementById('valor-emprestimo-range'),
      document.getElementById('valor-emprestimo')
    )
  }
}

document.addEventListener('DOMContentLoaded', function () {
  CreditasChallenge.initialize()
})
