# language: pt

Funcionalidade: Login

Funcionalidade de login que está sendo desenvolvida pela equipe, validar cenários
possíveis da aplicação

Esquema do Cenário: Login Sucesso
    Dado que o usuário está na tela de login
    E inserir <Credencial> válida
    Quando inserir <Senha> válida
    E tocar no botão Entrar 
    Então visualiza a tela de usuário logado

Exemplos:
|Credencial              | Senha         |
|"08011037463"           | "12345678"    |
|"deyvisonbm@gmail.com"  | "12345678"    |


Esquema do Cenário: Login dados inválidos
    Dado que o usuário está na tela de login
    E inserir <Credencial> inválida
    Quando inserir <Senha> inválida
    E tocar no botão Entrar
    Então visualiza mensagem de erro

Exemplos:
| Credencial             | Senha      |
| "080110"               | "12345678" |
| "deyvisonbm@gmail"     | "12345678" |
| "deyvisonbm@gmail.com" | ""         |
| ""                     | "12345678" |
| "deyvisonbm@gmail.com" | "1212"     |
| ""                     | ""         |

Cenário: Selecionar Esqueceu senha
    Dado que o usuário está na tela de login
    Quando tocar no botão Esqueceu a senha?
    Então visualiza a tela de esqueceu a senha




