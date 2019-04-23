import {
  changeInputElement,
  getFormValues,
  toStringFormValues,
  updateMaxValue,
  inputBlur,
  changeInstallmentValue,
  formatInput,
  formatOnBlur
} from '../src/lib/eventsHelper'
import { defaultPage } from '../src/lib/testConstants'

function initializeAppMock () {
  document.body.innerHTML = defaultPage
}

function clean () {
  document.body.innerHTML = ''
}

describe('Creditas Challenge', () => {
  const confirm = `Confirmação
Campo: parcelas, Valor: 24
Campo: garantia, Valor: vehicle
Campo: valor-garantia, Valor: R$ 123.455,00
Campo: valor-garantia-range, Valor: 123455
Campo: valor-emprestimo, Valor: R$ 90.455,00
Campo: valor-emprestimo-range, Valor: 90455
Total R$100,513.60`
  beforeEach(() => {
    initializeAppMock()
  })

  afterEach(() => {
    clean()
  })

  describe('Method: changeInputElement', () => {
    it('should change the text and range inputs', () => {
      const input = document.getElementById('valor-emprestimo')
      const range = document.getElementById('valor-emprestimo-range')
      changeInputElement(input, range, 30000, 4500000)
      expect(input.value).toBe('R$2,812,500.00')
      expect(range.value).toBe('2812500')
    })
  })

  describe('Method: toStringFormValues', () => {
    it('should return a message with form values', () => {
      const form = document.querySelector('.form')
      expect(toStringFormValues(getFormValues(form))).toBe(confirm)
    })
  })

  describe('Method: updateMaxValue', () => {
    it('should update max value of a range', () => {
      const range = document.getElementById('valor-emprestimo-range')
      updateMaxValue(6000000, range)
      expect(range.getAttribute('max')).toBe('6000000')
    })
  })

  describe('Method: changeInstallmentValue', () => {
    it('should update the installment value with the new one', () => {
      const total = document.querySelector('.amount_container p')
      const quota = document.querySelector('.quota span')
      const installments = document.getElementById('parcelas')
      const loanAmount = document.getElementById('valor-emprestimo')
      const tax = document.querySelector('.tax__container p')
      changeInstallmentValue(total, quota, installments, loanAmount, tax)
      expect(quota.innerHTML).toBe('4188,06')
      expect(tax.innerHTML).toBe('1,111 %')
      expect(total.innerHTML).toBe('R$100,513.60')
    })
  })

  describe('Method: formatInput', () => {
    it('should format text on input event', () => {
      const warrantyInput = document.getElementById('valor-garantia')
      formatInput(warrantyInput, 'd')
      expect(warrantyInput.value).toBe('R$ undefined')
    })
    it('should format text on input event', () => {
      const warrantyInput = document.getElementById('valor-garantia')
      formatInput(warrantyInput, 'R$ undefined')
      expect(warrantyInput.value).toBe('R$ ')
    })
  })

  describe('Method: inputBlur', () => {
    it('should update input and range value after blur event', () => {
      const range = document.getElementById('valor-emprestimo-range')
      const input = document.getElementById('valor-emprestimo')
      const value = inputBlur(input, range, 'R$ 50.000,00')
      expect(value).toBe(50000)
    })
    it('should set the max value after blur event', () => {
      const range = document.getElementById('valor-emprestimo-range')
      const input = document.getElementById('valor-emprestimo')
      const value = inputBlur(input, range, 'R$ 400.000,00')
      expect(value).toBe('100000')
    })
    it('should set the min value after blur event', () => {
      const range = document.getElementById('valor-emprestimo-range')
      const input = document.getElementById('valor-emprestimo')
      const value = inputBlur(input, range, 'R$ 1.000,00')
      expect(value).toBe('3000')
    })
  })

  describe('Method: formatOnBlur', () => {
    it('should format value after blur event', () => {
      const range = document.getElementById('valor-emprestimo-range')
      const input = document.getElementById('valor-emprestimo')
      formatOnBlur(input, range, 'R$ 50.000,00')
      expect(input.value).toBe('R$50,000.00')
    })
    it('should set the min value after receiving invalid value', () => {
      const range = document.getElementById('valor-emprestimo-range')
      const input = document.getElementById('valor-emprestimo')
      formatOnBlur(input, range, 'R$ sadaevafe')
      expect(input.value).toBe('R$3,000.00')
    })
  })
})
