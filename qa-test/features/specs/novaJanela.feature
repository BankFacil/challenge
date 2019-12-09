#language: pt

Funcionalidade: Nova Aba
    Sendo um usuário 
    Quero abrir uma nova aba do meu navegador
     
    @aba
    Cenário: Validando Nova Aba
        Dado que estou na tela principal do Opening a new window "The Internet"
        Quando eu clico no botão Clique Aqui
        Então eu devo ver uma nova aba com o título "New Window" e a mensagem "New Window"
    
        