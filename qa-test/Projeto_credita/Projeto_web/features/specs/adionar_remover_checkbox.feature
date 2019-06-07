#language: pt
#encoding: utf-8
@checkbox
Funcionalidade: Adionar e remover o checkbox
  Eu como usuário da aplicação   
  Quero acessar o site
  Para Adionar e remover o checkbox

Contexto: Acessar a homepage
  Dado que acesse a homepage

@add_checkbox
Cenário: Adionar o checkbox
  Quando clico no botão Add
  Entao o "A checkbox" é adicionado com sucesso

@remover_checkbox
Cenário: Remover o checkbox
  Quando clico no botão Remover
  Entao o "A checkbox" é removida com sucesso