/* eslint-disable no-undef */
import { getInstallmentValue, getTotalValue } from '.'

describe('METHOD: getTotalValue', () => {
  test('should be a function', () => {
    expect(typeof getTotalValue).toBe('function')
  })

  test('should return zero when no parameters', () => {
    const expected = 0
    const received = getTotalValue()
    expect(received).toEqual(expected)
  })

  test('should return total value', () => {
    const expected = 26668.8
    const received = getTotalValue({ installments: 24, loanAmount: 24000 })
    expect(received).toEqual(expected)
  })
})

describe('METHOD: getInstallmentValue', () => {
  test('should be a function', () => {
    expect(typeof getInstallmentValue).toBe('function')
  })

  test('should return zero when no parameters', () => {
    const expected = 0
    const received = getInstallmentValue()
    expect(received).toEqual(expected)
  })

  test('should return installment value', () => {
    const expected = 1000
    const received = getInstallmentValue({ installments: 24, totalValue: 24000 })
    expect(received).toEqual(expected)
  })
})