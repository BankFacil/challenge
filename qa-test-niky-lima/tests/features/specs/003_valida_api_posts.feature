# language: pt
# utf-8

Funcionalidade: Validar api de comentários

  - Eu, como testador, desejo utilizar uma api
    de posts e comentários, com a finalidade de
    verificar seu funcionamento.

@api
Cenário: Validar uma api de comentários
  Dado que eu acesso a api de comentários
  Quando eu envio o meu comentário
  Então o comentário deverá ser postado