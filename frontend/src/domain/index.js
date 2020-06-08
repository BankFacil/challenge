import constants from '../constants'

const getTotalValue = ({ installments = 0, loanAmount = 0 } = {}) => (constants.iof + constants.tax + (installments / 1000) + 1) * loanAmount

const getInstallmentValue = ({ installments = 0, totalValue = 0 } = {}) => totalValue / installments || 0

export {
  getTotalValue,
  getInstallmentValue
}
