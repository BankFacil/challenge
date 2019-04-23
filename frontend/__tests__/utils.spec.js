import {
  monthlyFee,
  currencyFormatter,
  formatValue,
  unformatter,
  calcAmount,
  maxLoan,
  renderOptions,
  selectedWarranty,
  checkFormValidity,
  setMaxLoan
} from '../src/lib/utils'
import { simplePage } from '../src/lib/testConstants'

function initializeAppMock () {
  document.body.innerHTML = simplePage
}

function clean () {
  document.body.innerHTML = ''
}

describe('Creditas Challenge', () => {
  beforeEach(() => {
    initializeAppMock()
  })

  afterEach(() => {
    clean()
  })

  describe('Method: checkFormValidity', () => {
    it('should return true when form is valid', () => {
      const form = document.querySelector('.form')
      expect(checkFormValidity(form)).toBeTruthy()
    })

    it('should return false when form is not valid', () => {
      const form = document.querySelector('.form')
      const input = document.querySelector('input')
      input.value = ''
      expect(checkFormValidity(form)).toBeFalsy()
    })
  })

  describe('Method: currencyFormatter', () => {
    it('should return a formatted value to BRL', () => {
      const value = 12345.45
      expect(currencyFormatter(value)).toBe('R$12,345.45')
    })
  })

  describe('Method: setMaxLoan', () => {
    it('should return the smallest number', () => {
      expect(setMaxLoan(120, 80)).toBe(80)
    })
    it('should return the greatest number', () => {
      expect(setMaxLoan(90, 80)).toBe(72)
    })
  })

  describe('Method: formatValue', () => {
    it('should return a formatted value xxxx,xx', () => {
      const value = 12345.453424
      expect(formatValue(value)).toBe('12345,45')
    })
  })

  describe('Method: unformatter', () => {
    it('should unformat BRL value to number', () => {
      const value = 'R$ 12345,56'
      expect(unformatter(value)).toBe(12345.56)
    })
  })

  describe('Method: calcAmount', () => {
    it('should return the total amount of payment', () => {
      const loanElement = document.getElementById('valor-emprestimo')
      const installmentsElement = document.getElementById('parcelas')
      expect(calcAmount(installmentsElement, loanElement)).toBe(137183.196)
    })
  })

  describe('Method: monthlyFee', () => {
    it('should return the loan monthly fee', () => {
      const installmentValue = 53455.125
      const loanValue = 1234563
      const installments = 24
      expect(monthlyFee(installmentValue, loanValue, installments)).toBe(1.039)
    })
  })

  describe('Method: maxLoan', () => {
    it('should add event listener to submit data form', () => {
      expect(maxLoan(100)).toBe(80)
    })
  })

  describe('Method: renderOptions', () => {
    it('should render the new options', () => {
      const installmentsElement = document.getElementById('parcelas')
      const instOptions = [120, 180, 240]
      renderOptions(installmentsElement, instOptions)
      expect(installmentsElement[0].value).toBe('120')
      expect(installmentsElement[1].value).toBe('180')
      expect(installmentsElement[2].value).toBe('240')
    })
  })

  describe('Method: selectedWarranty', () => {
    it('should return the warranty selected', () => {
      const warranty = selectedWarranty('vehicle')
      expect(warranty.maxLoan).toBe(100000)
      expect(warranty.minLoan).toBe(3000)
      expect(warranty.installments).toEqual([24, 36, 48])
    })
  })
})
