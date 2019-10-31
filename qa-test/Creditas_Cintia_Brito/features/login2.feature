#language:pt

@login2
Funcionalidade: Fazer Login
    Sendo um usuario do Creditas
    Posso logar no sistema com meus dados, previamente cadastrado 
    Para que eu possa consultar meus dados no sistema

Contexto: Formulário de Login
    Dado que estou na pagina principal

Cenário: Posso logar de usuario com email
    Quando faço login com "teste@teste.com.br" e "123456"
    Então sou autenticado com sucesso

Cenário: Posso logar de usuario com CPF
    Quando faço login com "99999999909" e "123456"
    Então sou autenticado com sucesso

Esquema do Cenário: Tentativas de login
    Quando faço login com "<email>" e "<senha>"
    Então eu devo ver a seguinte mensagem de "<alerta>"

    Exemplos:
        | email              | senha  | alerta                       |
        | teste@teste.com.br | 123456 | Senha inválida               |
        | teste80@teste.com  | 123456 | CPF/Email invalido           |
        |                    | 123456 | Preencha o campo obrigatorio |
        | teste@teste.com.br |        | Preencha o campo obrigatorio |
        |                    |        | Preencha o campo obrigatorio |