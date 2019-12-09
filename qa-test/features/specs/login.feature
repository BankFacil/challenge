#language: pt

Funcionalidade: Login
    Sendo um usuário já cadastrado
    Quero realizar login no site do Creditas
    Para eu ter acesso a minha conta

    Contexto:
        Dado que estou na tela de login

    Esquema do Cenário: Login positivo                     
        Quando eu informo os seguintes dados:                
        | login | <emailcpf> |
        | senha | <senha>    |                          
        E clico no botão entrar                              
        Então eu devo ver "<mensagem>"                       

    Exemplos: 
        | emailcpf                 | senha  | mensagem                                               |
        | marianatiberio@gmail.com | 123456 | Seja bem-vindo(a) ao Creditas, Mariana Marques Tibério |
        | 43207985890              | 123456 | Seja bem-vindo(a) ao Creditas, Mariana Marques Tibério |
        | marianatiberio@gmail.com | abcd   | E-mail ou senha inválidos                              |
        | 43207985890              | abcd   | CPF ou senha inválidos                                 |
        | 11111111111              | 123456 | CPF ou senha inválidos                                 |
        | 43207985890              |        | Favor preencher o campo senha                          |
        |                          | 123456 | Favor preencher o campo email/cpf                      |

    

    Cenário: Esqueci minha senha
        E clico no botão esqueci minha senha
        Quando eu informo o email "marianatiberio@gmail.com"
        E toco no botão recuperar senha
        Então eu devo ver "Enviamos um link para redefinir a sua senha por e-mail."

    Cenário: Esqueci minha senha usuário não cadastrado
        E clico no botão esqueci minha senha
        Quando eu informo o email "mariana1234@gmail.com"
        E toco no botão recuperar senha
        Então eu devo ver "Não conseguimos encontrar nenhum usuário com o endereço de e-mail informado."

    Cenário: Ajuda
        E clico no botão ajuda
        Então eu devo ser redirecionado para a tela de suporte da Creditas


        

        
