#language: pt

Funcionalidade: Login
  Para que somente eu possa ver minhas solicitações de empréstimo  
  Sendo um usuário
  Posso logar no sistema com meus dados de acesso previamente cadastrados
    
  @logout
  Esquema do Cenário: Login com sucesso
    Quando faço login com "pri@creditas.com.br" e "#T3st4nd0"
    Então sou autenticado com sucesso
    E vejo minhas solicitações de empréstimo
      Exemplos:
        | usuário              | senha       | 
        | pri@creditas.com.br  | #T3st4nd0   |
        | 38900978787          | #T3st4nd0   | 

  Esquema do Cenário: Tentativa de login
    
    Quando faço login com "<usuario>" e "<senha>"
    Então devo ver a mensagem "<alerta>"
      Exemplos:
        | usuario                    | senha     | alerta                              |
        | pri@creditas.com.br        | 12345678  | CPF ou Senha inválidos.             |
        | priscila@creditas.com.br   | #T3st4nd0 | CPF ou Senha inválidos.             |
        | pri@creditas.com.br        |           | Preencha esse campo para continuar  |
        |                            | T3st4nd0  | Preencha esse campo para continuar  |
        | 38900967895                | #12345678 | CPF ou Senha inválidos.             |
        | 38900978787                | 123456    | CPF ou Senha inválidos.             |
        | 38900967895                |           | Senha ausente.                      |
