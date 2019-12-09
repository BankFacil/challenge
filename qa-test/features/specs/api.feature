#language: pt

Funcionalidade: JsonPlaceHolder
    Sendo uma aplicação cliente
    Posso solicitar requisições POST para o serviço tracking
    Para que o usuário consiga criar posts e comentários

    @api
    Cenário: Criação
        Dado que o usuário informou os seguintes dados:
            | title  | foo |
            | body   | bar |
            | userId | 1   |
        Quando eu faço uma solicitação POST para o serviço order
        Então o código de resposta HTTP deve ser igual a "201"

    @api
    Esquema do Cenário: Validação de campos
        Dado que o usuário informou os seguintes dados:
            | title  | <title>  |
            | body   | <body>   |
            | userId | <userId> |
        Quando eu faço uma solicitação POST para o serviço order
        Então o código de resposta HTTP deve ser igual a "<status>"
        E devo visualizar um json conforme o contrato da API do serviço POST

    Exemplos:
        | title | body | userId | status |
        | abc   |      | yza    | 201    |
        | def   | mno  |        | 201    |
        |       | pqr  | 12     | 201    |
        | 123   | stu  | 2      | 201    |
        | ghi   | 123  | 3      | 201    |
        | jkl   | vwx  | 123    | 201    |


        