/* eslint-disable no-undef */
import { handleChangeForm, handleChangeWarrantyType, submitForm, CreditasChallenge } from './app'
import { getElementsObjectByID } from './utils'
import { loanService } from './services'

jest.mock('./services', () => ({
  loanService: {
    create: jest.fn().mockImplementation(() => new Promise((resolve, reject) => {
      try {
        resolve('resolve')
      } catch (error) {
        reject(error)
      }
    }))
  }
}))

describe('METHOD: handleChangeForm', () => {
  test('should be a function', () => {
    expect(typeof handleChangeForm).toBe('function')
  })

  beforeEach(() => {
    document.body.innerHTML = `<form>
      <input id="installments" value="10"/>
      <input id="loanvalue" value="1000"/>
      <span id="totalvalue"></span>
      <span id="installmentvalue"></span>
      <span id="taxvalue"></span>
    </form>`

    const elements = getElementsObjectByID(document.querySelectorAll('form *'))
    handleChangeForm(elements)
  })

  test('should set totalvalue element', () => {
    expect(document.getElementById('totalvalue').innerHTML).toEqual('1,097.20')
  })

  test('should set installmentvalue element', () => {
    expect(document.getElementById('installmentvalue').innerHTML).toEqual('109.72')
  })

  test('should set taxvalue element', () => {
    expect(document.getElementById('taxvalue').innerHTML).toEqual('2.34%')
  })
})

describe('METHOD: handleChangeWarrantyType', () => {
  test('should be a function', () => {
    expect(typeof handleChangeWarrantyType).toBe('function')
  })

  beforeEach(() => {
    document.body.innerHTML =
    `<form>
      <input id="installments" value="10"/>
      <input id="loanvalue" value="1000"/>
      <input type="range" min="0" max="100" id="loanvaluerange" value="1000"/>
      <input type="range" min="0" max="100" id="loanvalue" value="1000"/>
      <span id="rangestart"></span>
      <span id="rangeend"></span>
      <span id="totalvalue"></span>
      <span id="installmentvalue"></span>
      <span id="taxvalue"></span>
    </form>`

    const elements = getElementsObjectByID(document.querySelectorAll('form *'))
    const event = {
      target: { value: 'vehicle' }
    }

    handleChangeWarrantyType(elements, event)
  })

  afterEach(() => {
    document.body.innerHTML = ''
  })

  test('should set loanvalue element', () => {
    expect(document.getElementById('loanvalue').value).toEqual('1000')
  })

  test('should set loanvaluerange min element', () => {
    expect(document.getElementById('loanvaluerange').min).toEqual('3000')
  })

  test('should set loanvaluerange max element', () => {
    expect(document.getElementById('loanvaluerange').max).toEqual('100000')
  })

  test('should set loanvaluerange value element', () => {
    expect(document.getElementById('loanvaluerange').value).toEqual('3000')
  })

  test('should set rangestart element', () => {
    expect(document.getElementById('rangestart').innerHTML).toEqual('3,000.00')
  })

  test('should set rangeend element', () => {
    expect(document.getElementById('rangeend').innerHTML).toEqual('100,000.00')
  })

  test('should set installments element', () => {
    expect(document.getElementById('installments').innerHTML)
      .toEqual('<option value="24">24</option><option value="36">36</option><option value="48">48</option>')
  })
})

describe('METHOD: submitForm', () => {
  let formElement
  let event

  beforeEach(() => {
    jest.spyOn(window, 'alert').mockImplementation(() => {})
    jest.spyOn(window, 'confirm').mockImplementation(() => {})

    document.body.innerHTML =
      `<form id="form">
        <input required id="installments" value="10"/>
        <input required id="loanvalue" value="1000"/>
        <input required type="range" min="0" max="100" id="loanvaluerange" value="10"/>
        <input required type="range" min="0" max="100" id="loanvalue" value="10"/>
        <span id="rangestart"></span>
        <span id="rangeend"></span>
        <span id="totalvalue"></span>
        <span id="installmentvalue"></span>
        <span id="taxvalue"></span>
        <button>Enviar</button>
      </form>`

    formElement = document.getElementById('form')
    event = {
      preventDefault: () => {}
    }

    submitForm(event, formElement)
  })

  afterEach(() => {
    document.body.innerHTML = ''
  })

  describe('THEN', () => {
    test('should be a function', () => {
      expect(typeof submitForm).toBe('function')
    })

    test('should loanService.create be called', () => {
      expect(loanService.create).toHaveBeenCalled()
    })
  })
})

describe('METHOD: initialize', () => {
  beforeEach(() => {
    jest.spyOn(window, 'alert').mockImplementation(() => {})
    jest.spyOn(window, 'confirm').mockImplementation(() => {})

    document.body.innerHTML =
      `<form id="form">
        <input required id="installments" value="10"/>
        <input required id="loanvalue" value="10" />
        <input required id="warrantyvaluerange" value="10"/>
        <input required id="warrantyvalue" value="100"/>
        <input required id="warrantytype" />
        <input required type="range" min="0" max="100" id="loanvaluerange" value="10"/>
        <input required type="range" min="0" max="100" id="loanvalue" value="10"/>
        <span id="rangestart"></span>
        <span id="rangeend"></span>
        <span id="totalvalue"></span>
        <span id="installmentvalue"></span>
        <span id="taxvalue"></span>
        <button>Enviar</button>
      </form>`

    CreditasChallenge.initialize()
  })

  afterEach(() => {
    document.body.innerHTML = ''
  })

  test('warrantyvaluerange - addEventListener', () => {
    document.getElementById('warrantyvaluerange').dispatchEvent(new Event('input'))
    expect(document.getElementById('warrantyvalue').value).toEqual('10')
  })

  test('loanvaluerangeadd - addEventListener', () => {
    document.getElementById('loanvaluerange').dispatchEvent(new Event('input'))
    expect(document.getElementById('loanvalue').value).toEqual('10')
  })

  test('warrantyvalue - addEventListener', () => {
    document.getElementById('warrantyvalue').dispatchEvent(new Event('input'))
    expect(document.getElementById('warrantyvaluerange').value).toEqual('100')
  })

  test('loanvalue - addEventListener', () => {
    document.getElementById('loanvalue').dispatchEvent(new Event('input'))
    expect(document.getElementById('loanvaluerange').value).toEqual('10')
  })
})
