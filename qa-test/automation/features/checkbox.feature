# language: pt

Funcionalidade:
  Remover e adicionar o checkbox na tela
  Validar funcionalidade do checkbox

  Contexto:
    Dado que eu acesse a url de checkbox

    Cenário: Validar remover checkbox
      Quando eu clicar no botão Remove
      Então o checkbox não deverá mais ser exibido
      E deverá exibir a mensagem "It's gone"

    Cenário: Validar adicionar checkbox
      Quando eu clicar no botão Remove
      E eu clicar no botão Add
      Então deverá exibir a mensagem "It's back"

    Cenário: Validar seleção do checkbox
      Quando eu clicar no botão Remove
      E eu clicar no botão Add
      E eu selecionar o checkbox
      Então o checkbox deverá exibir marcado

    Cenário: Validar des-seleção do checkbox
      Quando eu clicar no botão Remove
      E eu clicar no botão Add
      E eu selecionar o checkbox
      E eu des-selecionar o checkbox
      Então o checkbox deverá exibir desmarcado
