/* eslint-disable no-undef */
import { toCurrency, toStringValues, checkFormValidity, getFormValues, getElementsObjectByID } from '.'

describe('METHOD: toCurrency', () => {
  test('should be a function', () => {
    expect(typeof toCurrency).toBe('function')
  })

  test('should return default value', () => {
    const expected = '0.00'
    const received = toCurrency()
    expect(received).toBe(expected)
  })

  test('should return formated value', () => {
    const expected = '1,000.00'
    const received = toCurrency({ value: 1000 })
    expect(received).toBe(expected)
  })

  test('should return formated value with symbol', () => {
    const expected = 'R$1,000.00'
    const received = toCurrency({ value: 1000, withSymbol: true })
    expect(received).toBe(expected)
  })

  test('should return formated value with more decimals', () => {
    const expected = '1,000.1235'
    const received = toCurrency({ value: 1000.1234567, numDecimal: 4 })
    expect(received).toBe(expected)
  })
})

describe('METHOD: toStringValues', () => {
  test('should be a function', () => {
    expect(typeof toStringValues).toBe('function')
  })

  test('should return a string when a valid fiel', () => {
    const expected = 'CONFIRMAÇÃO\n\nValor do empréstimo: 1000\nTotal 10000'
    const received = toStringValues([{ field: 'loanvalue', value: 1000 }], 10000)
    expect(received).toEqual(expected)
  })

  test('should return a string without some parameters when field doesn`t match constants', () => {
    const expected = `CONFIRMAÇÃO\n\n\nTotal 10000`
    const received = toStringValues([{ field: 'field', value: 'value' }], 10000)
    expect(received).toEqual(expected)
  })
})

describe('METHOD: checkFormValidity', () => {
  let form

  beforeEach(() => {
    document.body.innerHTML = `
      <form class="form" id="form">
        <input id="field1" required value="field1"/>
        <input id="field2" required value="field2"/>
      </form>`

    form = document.querySelector('.form')
  })

  afterEach(() => {
    document.body.innerHTML = ''
  })

  test('should be a function', () => {
    expect(typeof checkFormValidity).toBe('function')
  })

  test('should return true when form is valid', () => {
    const received = checkFormValidity(form)
    expect(received).toBeTruthy()
  })

  test('should return false when form is valid', () => {
    document.getElementById('field1').value = ''
    const received = checkFormValidity(form)
    expect(received).toBeFalsy()
  })
})

describe('METHOD: getFormValues', () => {
  let form

  beforeEach(() => {
    document.body.innerHTML = `
      <form class="form" id="form">
        <input id="field1" required value="value1" name='field1'/>
        <input id="field2" required value="value2" name='field2'/>
      </form>`

    form = document.querySelector('.form')
  })

  afterEach(() => {
    document.body.innerHTML = ''
  })

  test('should be a function', () => {
    expect(typeof getFormValues).toBe('function')
  })

  test('should return object with fields and values', () => {
    const expected = [{ field: 'field1', value: 'value1' }, { field: 'field2', value: 'value2' }]
    const received = getFormValues(form)
    expect(received).toEqual(expected)
  })
})

describe('METHOD: getElementsObjectByID', () => {
  beforeEach(() => {
    document.body.innerHTML = `
      <form class="form" id="form">
        <input id="field1" required value="value1" name='field1'/>
        <input id="field2" required value="value2" name='field2'/>
      </form>`

    form = document.querySelector('.form')
  })

  afterEach(() => {
    document.body.innerHTML = ''
  })

  test('should be a function', () => {
    expect(typeof getElementsObjectByID).toBe('function')
  })

  test('should return object with elements', () => {
    const form = document.querySelectorAll('form *')
    const expected = 2
    const received = getElementsObjectByID(form)
    expect(Object.values(received).length).toEqual(expected)
  })

  test('should return object elements with id only', () => {
    const form = document.querySelectorAll('form *')
    document.getElementById('field2').id = ''
    const expected = 1
    const received = getElementsObjectByID(form)
    expect(Object.values(received).length).toEqual(expected)
  })
})
