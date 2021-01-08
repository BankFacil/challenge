#language: pt
@checkbox
Funcionalidade: Adionar e remover o checkbox

  Contexto:
    Dado que eu acessei o site do the-internet
   
  Cenario: Remover checkbox
   Quando eu removo o checkbox
   Então eu verifico se o checkbox foi removido
   E verifico a mensagem "It's gone!"

  Cenario: Adicionar checkbox
    Dado que eu removi o checkbox
    Quando eu adicionar o checkbox
    Então eu verifico se o checkbox foi adicionado
    E verifico a mensagem "It's back!" 