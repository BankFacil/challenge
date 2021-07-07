#language: pt

Funcionalidade: Checkbox
  Para demostrar meus conhecimentos  
  Sendo um candidato a vaga de QA na Creditas 
  Possa habilitar e desabilitar um Checkbox 

  Contexto:
    Dado que eu acesso a url Dynamic Controls

    Cenário: Remover Checkbox
      Quando clico no botão de desabilitar o Checkbox
      Então devo ver a mensagem "It's gone!"
      E o checkbox deve ficar invisível na página

    Cenário: Adicionar Checkbox
      E o checkbox está desabilitado
      Quando clico no botão de habilitar o Checkbox
      Então devo ver a mensagem "It's back!"
      E o checkbox deve ficar visível na página