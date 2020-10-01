# language: pt
@api
Funcionalidade: Adiconar e remover checkbox
  Eu como desafiado
  Quero fazer um post e validar a criação do mesmo
  Para concluir o desafio
@wip
  Cenário: Realizar um post e validar se o mesmo foi criado
    Dado que eu faço um post na api do desafio
    Quando a api responde o status code "201" criado
    Então eu valido as informações que meu post foi criado
