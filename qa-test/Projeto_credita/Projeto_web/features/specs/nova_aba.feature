#language: pt
#encoding: utf-8
@aba
Funcionalidade: Validar nova Aba
  Eu como usuário da aplicação   
  quero que seja exibida uma nova aba
  Para para que eu possa visualizar as novas funcionalidades

Contexto: Acessar a homepage
  Dado que acesse a homepage

@nova_aba
  Cenário: validar nova aba
  Quando clico no Link Click Here
  Entao a nova aba é abresentada com o texto "New Window"