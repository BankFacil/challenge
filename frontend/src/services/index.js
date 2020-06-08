import { getTotalValue } from '../domain'
import { toStringValues } from '../utils'

const loanService = {
  create: values => {
    return new Promise((resolve, reject) => {
      try {
        const installments = values.find(value => value.field === 'installments').value
        const loanvalue = values.find(value => value.field === 'loanvalue').value
        const totalvalue = getTotalValue({ installments: installments, loanAmount: loanvalue })

        const response = toStringValues(values, totalvalue)

        resolve(response)
      } catch (error) {
        reject(error)
      }
    })
  }
}

export {
  loanService
}
