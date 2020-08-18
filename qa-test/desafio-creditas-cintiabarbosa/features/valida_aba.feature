#language: pt

Funcionalidade: Validar aba aberta pelo link no site 
Eu como usuario
Quero poder abrir uma nova aba no site ao clicar no link
Para melhorar a navegação do site

@valida_aba
Cenario: Validar aba aberta pelo link
Dado que acessei o site com o link para nova janela 
Quando clicar no link
Então abre uma nova janela 
E devo verificar se a aba esta correta
