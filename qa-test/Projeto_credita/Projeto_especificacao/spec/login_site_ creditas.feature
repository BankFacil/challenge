#language:pt
@login
Funcionalidade: realizar login no site da Creditas
  Para validar a autenticação no site da Creditas
  Como usuário do sistema
  Eu quero logar e ter acesso as infromações respectivas a minha conta

Contexto: possibilidade de acessar o site da Creditas utilizando cpf
  Dado que o usuário possa acessar a tela de login do site da Creditas
  
  @login_cpf
  Esquema do Cenário: realizar login no site da Creditas com CPF válidos
    Quando informar um <CPF> válido
    E inserir uma <Senha> válida
    Então o sistema deve permitir a autenticação do usuário com sucesso
    
    Exemplos:
    | CPF       | Senha  | 
    | "Marcelo" | "0201" |
    | "Thiago"  | "3003" |

  @login_email
  Esquema do Cenário: realizar login no site da Creditas com Email válidos
    Quando informar um <Email> válido
    E inserir uma <Senha> válida
    Então o sistema deve permitir a autenticação do usuário com sucesso
    
    Exemplos:
    | Email               | Senha  | 
    | "marcelo@gmail.com" | "0201" |
    | "thiago@gmail.com"  | "3003" |

  @redefinir_senha
  Cenário: Redefinir senha
    Quando clico em esqueceu a senha?
    E preencho o E-mail correspondente
    E clico no botão REUPERAR A SENHA
    Entao é apresentado uma mensagem de confirmação "Enviamos o link de redefinição de senha para $email"


  @login_invalido
  Cenário: validar Login sem sucesso com dados invalidos 
    Quando informar os campos usuário e senha com dados invalidos 
    |Email               |Senha  | 
    |"marcelo@gmail.com" |123456 | 
    E clico no botão Entrar 
    Então é apresentado a mensagem de login inválido 
    """ 
      CPF/Email ou Senha inválidos. 
    """