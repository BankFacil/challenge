# language: pt
Funcionalidade: Login

  Cenario: Fazer login usando cpf com sucesso
  Dado que eu tenho um usuario
    |cpf        |senha |
    |13978000706|123456|
  Quando faco login
  Entao verifico se estou logado

  Cenario: Fazer login usando email com sucesso
    Dado que eu tenho um usuario
      |email          |senha |
      |bruno@gmail.com|123456|
    Quando faco login
    Entao verifico se estou logado
  
  Esquema do Cenario: Validar campos inválidos
    Quando preencho o <usuario> e <senha> invalidos
    Entao eu valido a <mensagem> de erro

  Exemplos:
    |usuario          |senha    |mensagem                            |
    |""               |"123456" |"Preencha esse campo para continuar"|
    |"13978000706"    |""       |"Preencha esse campo para continuar"|
    |""               |""       |"Preencha esse campo para continuar"|           |
    |"13123"          |"123456" |"CPF ou Senha inválidos."           |
    |"13978000706"    |"123"    |"CPF ou Senha inválidos."           |
    |"brunobatista"   |"123456" |"Email ou Senha inválidos."         |
    |"bruno@gmail.com"|"123456" |"Email ou Senha inválidos."         |
 
  Cenario: Fazer login com facebook
    Quando faco login com facebook
    Entao verifico se fui logado com sucesso

  Cenario: Esquecer a senha
   Quando eu preencho e envio o email
   Entao eu verifico a mensagem de envio de email