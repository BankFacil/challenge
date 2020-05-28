# language: pt

Funcionalidade:
  Clicar no link e validar que a outra aba foi aberta corretamente

  Contexto:
    Dado que eu acesse a url da nova aba

    Cenário: Validar clique no link
      Quando eu clicar no link Click Here
      Então deverá abrir uma nova aba corretamente
      E deverá exibir New Window
