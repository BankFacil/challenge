# language: pt

Funcionalidade: Login do site da Creditas
    Testa o login na página


Contexto: 
    Dado que estou na página de Login


Esquema do Cenário: Login e senha válidos
''' Os logins passados serão tanto CPF quanto email '''
    Quando preencher o <login> e a <senha>
    Então a página de acesso deve ser exibida

Exemplos:
|login              |senha    |
|01234567890        |senha1   |
|email@valido.com   |senha2   |


Esquema do Cenário: Login não cadastrado 
    Quando preencher o <login> e a <senha>
    Então a mensagem <mensagem> deve ser exibida

Exemplos:
|login                      |senha      |mensagem                   |
|99999999999                |senha1     |Usuário não cadastrado     |
|email@naocadastrado.com    |senha2     |Usuário não cadastrado     |


Esquema do Cenário: Login válido e senha incorreta 
    Quando preencher o <login> e a <senha>
    Então a mensagem <mensagem> deve ser exibida

Exemplos:
|login              |senha              |mensagem           |
|01234567890        |senha_incorreta1   |Senha Incorreta    |
|email@valido.com   |senha_incorreta1   |Senha Incorreta    |


Esquema do Cenário: Login inválido
    Quando preencher o <login> e a <senha>
    Então a mensagem <mensagem> deve ser exibida

Exemplos:
|login                      |senha      |mensagem               |
|um número de CPF inválido  |senha1     |Número de CPF inválido |
|email.com                  |senha1     |email inválido         |
|email@dominiocom           |senha1     |email inválido         |
|email@dominio              |senha1     |email inválido         |