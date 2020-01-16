import './styles.css'

document.addEventListener('DOMContentLoaded', function () { CreditasChallenge.initialize() })

export default class CreditasChallenge {
  static initialize() {
    this.registerEvents()
    resetGarantia()
  }

  static registerEvents() {
    Submit(document.querySelector('.form'))

    handleChangeGarantia()

    handleChangeValues(document.getElementById('parcelas'))
    handleChangeValues(document.getElementById('garantia'))
    handleChangeValues(document.getElementById('valor-emprestimo'))

    handleChangeRanges(document.getElementById('valor-garantia-range'),document.getElementById('valor-garantia'),garantiaProduto[garantiaProduto.ativo].limiteMin80)
    handleChangeRanges(document.getElementById('valor-emprestimo-range'),document.getElementById('valor-emprestimo'),garantiaProduto[garantiaProduto.ativo].limiteMin)
  }
}


// regras.js  ---------------------------
export const garantiaProduto = {
  veiculo : {
    limiteMin: 3000,
    limiteMax: 100000,
    Prazo:[24,36,48],
    limiteMin80:(5 * 100000)/4
  },
  imovel : {
    limiteMin: 30000,
    limiteMax: 4500000,
    Prazo:[120,180,240],
    limiteMin80:(5 * 30000)/4
  },
  get ativo() {
    const element = document.getElementById('garantia')
    return element.value
  }
}
export function resetGarantia(){
  const elemento = document.getElementById('garantia')
  const limiteMin = garantiaProduto[garantiaProduto.ativo].limiteMin
  const limiteMax = garantiaProduto[garantiaProduto.ativo].limiteMax
  const limiteMin80perc = (5 * limiteMin)/4
  const limiteMax80perc = (5 * limiteMax)/4
  const evento = new Event('change');
  exibirRanges(
    document.getElementById('valor-emprestimo-range'),
    document.getElementById('valor-emprestimo'),
    [limiteMin, limiteMax]
    )
  exibirRanges(
    document.getElementById('valor-garantia-range'),
    document.getElementById('valor-garantia'),
    [limiteMin80perc, limiteMax80perc]
    )
  exibirPrazos(document.getElementById('parcelas'))
  elemento.dispatchEvent(evento);
}


// eventos.js  --------------------------
export function Submit(formElement) {
  formElement.addEventListener('submit', function (event) {
    event.preventDefault()
    if (checkFormValidity(formElement)) {
      Send(getFormValues(formElement))
      .then(result => confirm(result, 'Your form submited success'))
      .catch(error => Alert('Your form submited error', error))
    }
  })
}
export function Send(values) {
  return new Promise((resolve, reject) => {
    try {
      resolve(toStringFormValues(values))
    } catch (error) {
      reject(error)
    }
  })
}
export function handleChangeValues(EntradasValor){
  EntradasValor.addEventListener('change', function (event) {
    exibirParcela(
      document.querySelector('.quota span'),
      document.querySelector('.form'),
      document.getElementById('parcelas')
      )
    exibirTotalAPagar(
      document.querySelector('.amount_container p'),
      document.querySelector('.form')
      )
  })
}
export function handleChangeGarantia(){
  document.getElementById('garantia').addEventListener('change', function (event) {
    resetGarantia()
  })
}
export function handleChangeRanges(RangeElement, Element, minValor) {
  RangeElement.addEventListener('change', function (event) {
    Element.value = Number(event.target.value);
    var evento = new Event('change');
    Element.dispatchEvent(evento);
  })
}



// exibir.js  ---------------------------
export function exibirParcela(elemento,formElement,prazo){
  const elementoValores = getFormValues(formElement)
  elemento.innerHTML = showMoeda(valorTotalAPagar(elementoValores) / prazo.value)
}
export function exibirTotalAPagar(elemento,formElement){
  const elementoValores = getFormValues(formElement)
  elemento.innerHTML = showMoeda(valorTotalAPagar(elementoValores),'R$')
}
export function exibirPrazos(element){
  element.innerHTML = listaPrazos(garantiaProduto[garantiaProduto.ativo].Prazo)
}
export function exibirRanges(RangeElement, Element, LimValues) {
  RangeElement.setAttribute('min', LimValues[0])
  RangeElement.setAttribute('max', LimValues[1])
  RangeElement.value = LimValues[0]
  RangeElement.parentNode.children[1].children[0].innerHTML = showMoeda(LimValues[0],'R$')
  RangeElement.parentNode.children[1].children[1].innerHTML = showMoeda(LimValues[1],'R$')
  Element.value = LimValues[0]
}
export const valorTotalAPagar = values => {
  const match = matchString => value => value.field === matchString
  const IOF = 6.38 / 100
  const INTEREST_RATE = 2.34 / 100
  const TIME = values.find(match('parcelas')).value / 1000
  const LOAN_AMOUNT = values.find(match('valor-emprestimo')).value

  return ((IOF + INTEREST_RATE + TIME + 1) * LOAN_AMOUNT)
}



//tools.js
export const toStringFormValues = values => {
  const valorTotal = valorTotalAPagar(values)
  return `Confirmação\n\n${values
    .map(value => `Campo: ${value.field}, Valor: ${value.value}`)
    .join('\n')}`.concat(
      `\nTotal ${valorTotal}`
      )
  }
  export const checkFormValidity = formElement => formElement.checkValidity()
  export const getFormValues = formElement =>
  Object.values(formElement.elements)
  .filter(element => ['SELECT', 'INPUT'].includes(element.nodeName))
  .map(element => ({
    field: element.name,
    value: element.value
  })
  )
  export function showMoeda(numero, cifrao){
    cifrao = (typeof cifrao !== 'undefined') ? cifrao : '';
    return cifrao + ' ' + numero.toLocaleString('pt-br', {minimumFractionDigits: 2});
  }
