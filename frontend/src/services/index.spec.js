/* eslint-disable no-undef */
import { loanService } from '.'

const loanServiceCreate = loanService.create

describe('SERVICE: loanService', () => {
  afterEach(() => {
    loanService.create = loanServiceCreate
  })

  test('should be a object', () => {
    expect(typeof loanService).toBe('object')
  })

  describe('METHOD: loanService', () => {
    test('should be a function', () => {
      expect(typeof loanService.create).toBe('function')
    })

    test('should return a string', () => {
      const expected = `CONFIRMAÇÃO\n\nQuantidade de parcelas: 100000\nValor do empréstimo: 100\nTotal 10108.72`

      loanService.create([
        { field: 'installments', value: 100000 },
        { field: 'loanvalue', value: 100 }
      ]).then(response => {
        expect(response).toEqual(expected)
      })
    })

    test('should return an error', () => {
      loanService.create().catch(error => {
        expect(error).toBeTruthy()
      })
    })
  })
})
