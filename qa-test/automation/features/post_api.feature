# language: pt

Funcionalidade:
  Realizar um post e validar que o mesmo foi criado através do response code e do response body

  Cenário: Validar post na api
    Quando preencher e enviar o body
    Então o status da requisição deverá retornar 201
