/* <!--
  =========================================================
  Que tal aumentar o coverage para que ele comece a passar
  nos critérios do desafio?

  Objetivo: Alcançar 80% de cobertura, mas não se preocupe
  se não chegar a alcançar a objetivo, faça o quanto você
  acha que é necessário para garantir segurança quando um
  outro amigo for mexer no mesmo código que você :)

  Confira nossas taxas de coberturas atuais :(

  ----------|----------|----------|----------|----------|-------------------|
  File      |  % Stmts | % Branch |  % Funcs |  % Lines | Uncovered Line #s |
  ----------|----------|----------|----------|----------|-------------------|
  All files |    15.79 |        0 |     9.52 |    14.29 |                   |
  index.js  |    15.79 |        0 |     9.52 |    14.29 |... 72,76,78,83,91 |
  ----------|----------|----------|----------|----------|-------------------|
  Jest: Uncovered count for statements (32)exceeds global threshold (10)
  Jest: "global" coverage threshold for branches (80%) not met: 0%
  Jest: "global" coverage threshold for lines (80%) not met: 14.29%
  Jest: "global" coverage threshold for functions (80%) not met: 9.52%
--> */

import CreditasChallenge, {
  checkFormValidity,
  getFormValues,
  toStringFormValues,
  Send,
  Submit,
  valorTotalAPagar,
  showMoeda
} from '../src/index'

function initializeAppMock () {
  document.body.innerHTML = `
    <form class="form" data-testid="form">
      <label for="valor-garantia">Valor da Garantia</label>
      <input id="valor-garantia" required />
      <button type="button"></button>
    </form>
  `
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
    it('should return true when form has valid', () => {
      const form = document.querySelector('.form')
      const input = document.querySelector('input')
      input.value = 10
      expect(checkFormValidity(form)).toBeTruthy()
    })

    it('should return false when form has not valid', () => {
      const form = document.querySelector('.form')
      expect(checkFormValidity(form)).toBeFalsy()
    })
  })

  describe('Method: Submit', () => {
    it('should add event listener to submit data form', () => {
      const container = document.querySelector('.form')
      Submit(container)
    })
  })

  describe('Method: getFormValues', () => {
    it('deve retornar os valores', () => {
      const form = document.querySelector('.form')
      const input = document.querySelector('input')
      input.value = 10
      expect(getFormValues(form)).toBeTruthy()
    })
  })

  describe('Method: showMoeda', () => {
    it('deve retornar uma string com o valor representado em moeda', () => {
      const numero = 10000
      expect(showMoeda(numero)).toBe(" 10,000.00")
    })
    it('deve retornar uma string com o valor representado em moeda e com cifrão', () => {
      const numero = 4500000
      expect(showMoeda(numero, "R$")).toBe("R$ 4,500,000.00")
    })
  })
  
})
