#language: pt

Funcionalidade: Requisição Post
  Sendo uma aplicação cliente
  Posso solicitar requisições POST para a API
  Para que a requisição do usuário sejam cadastradas no sistema

  Cenário: Post
    Dado que o usuário informou os seguintes dados 
      | userId | 1                         |
      | id     | 3768687                   |
      | title  | Desafio Creditas          |
      | body   | Desafio qa-test Creditas! |  
                                        
    Quando eu faço uma solicitação POST para API
    Então o código de resposta HTTP deve ser igual a "201"
    E os dados devem ser cadastrados com sucesso
