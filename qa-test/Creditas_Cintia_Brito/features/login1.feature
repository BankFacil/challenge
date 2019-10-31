#language:pt

@login1
Funcionalidade: Fazer Login
    Sendo um usuario do Creditas
    Posso logar no sistema com meus dados, previamente cadastrado 
    Para que eu possa consultar meus dados no sistema

Cenário: Posso logar de usuario com email
    Dado que estou na pagina principal
    Quando coloco um email cadastrado
    E passar uma senha
    Então sou autenticado com sucesso
    E posso verificar meu dados no sistema

Cenário: Posso logar de usuario com CPF
    Dado que estou na pagina principal
    Quando coloco um cpf cadastrado
    E passar uma senha
    Então sou autenticado com sucesso
    E posso verificar meu dados no sistema

Cenário: Inserir email invalidos
    Dado que estou na pagina principal
    Quando coloco um email nao cadastro
    E passar uma senha
    Então apresenta uma mensagem "CPF/Email invalido"

Cenário: Inserir CPF invalidos
    Dado que estou na pagina principal
    Quando coloco um cpf nao cadastro
    E passar uma senha
    Então apresenta uma mensagem "CPF/Email invalido"

Cenário: Campo email em branco
    Dado que estou na pagina principal
    Quando nao coloco o email
    E passar uma senha
    Então apresenta uma mensagem "Preencha o campo obrigatorio"

Cenário: Campo senha em branco
    Dado que estou na pagina principal
    Quando coloco um email cadastrado
    E nao passar uma senha
    Então apresenta uma mensagem "Preencha o campo obrigatorio"

Cenário: Campo email e senha em branco
    Dado que estou na pagina principal
    Quando nao coloco um email cadastrado
    E nao passar uma senha
    Então apresenta uma mensagem "Preencha o campo obrigatorio"