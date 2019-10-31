#language: pt

@api
Funcionalidade: Automatizando o metodo POST

Sendo uma aplicação JsonPlaceHolder
Posso solicitar uma requisição do tipo POST
Para poder verificar o response na tela

Cenario: Enviar um POST e verificar o response

  Dado que eu envie os parâmetros para o endpoint POST
  Entao devo ver o response code e response body na tela