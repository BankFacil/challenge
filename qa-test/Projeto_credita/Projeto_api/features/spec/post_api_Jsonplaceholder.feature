#language: pt
@post
Funcionalidade: Criar Post API JsonPlaceHolder
  Eu como tester
  Desejo criar uma post no site JsonPlaceHolder
  Para controlar e validar as infromações postadas 

  @criar_post
  Cenário: Crie novas puclicacões na API pública JsonPlaceHolder utilizando o verbo POST
    Dado dados que crie um POST para API pública JsonPlaceHolder
    Então o status code é "200"
    E é criado o POST com sucesso