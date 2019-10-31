#language:pt

@check
Funcionalidade: Checkbox
    Sendo um usuario
    Posso adicionar e remover o checkbox na tela 
    Para que eu possa validar se foi corretamente adicionado e removido da tela


Cenario: Posso adicionar o checkbok na tela
    Dado estou na pagina dynamic controls
    Quando clico no botão Remove
    E clico no botão Add
    Então aparece o checkbox na tela


Cenario: Posso remover o checkbox da tela
    Dado estou na pagina dynamic controls
    Quando clico no botão Remove
    Entao o checkbox é removido da tela

