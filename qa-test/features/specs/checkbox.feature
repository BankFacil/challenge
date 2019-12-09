#language: pt

Funcionalidade: Remover e adicionar o checkbox na tela
    Sendo um usuário 
    Quero remover e adicionar o checkbox da tela
    Pois sou indeciso :P

    Contexto:
        Dado que estou na tela principal do Dynamic Controls

    @checkbox
    Cenário: Remover checkbox
        Quando eu clico no botão Remover
        Então eu devo ver a mensagem "It's gone!"
        E não devo ver o checkbox

    @checkbox @add
    Cenário: Adicionar checkbox
        Dado que eu removi o checkbox
        Quando eu clico no botão Adicionar
        Então eu devo ver a mensagem "It's back!"
        E devo ver o checkbox
        