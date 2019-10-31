#language:pt

@aba
Funcionalidade: Validar se foi aberto uma nova Aba
    Sendo um usuario
    Posso abrir uma nova aba no site ao clicar no link 
    Para que eu possa validar se uma nova Aba foi aberto com sucesso


Cenario: Validar se a Aba foi aberto pelo link
    Dado estou na pagina windows
    Quando clicar no link
    Então posso ver uma nova aba
    E verificar se a aba foi aberta corretamente 