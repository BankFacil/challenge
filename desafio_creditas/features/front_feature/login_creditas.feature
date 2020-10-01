# language: pt
@login_creditas
Funcionalidade: Efetuar login no site da creditas
  Eu como desafiado
  Quero validar a tela de login da creditas
  Para ajudar a equipe de desenvolvimento a entregar a melhor tela de login

  Cenario: Efetuar login com sucesso
    Dado que eu acesso o site da creditas
    Quando eu preencher os dados do usuário
    Então eu verei minhas solicitações de emprestimos

  Cenario: Efetuar login com usuário invalido
    Dado que eu acesso o site da creditas
    Quando eu preencher os dados do usuário inválido
    E eu preencho a senha correta
    Então eu verei a mensagem "Usuário ou senha invalidos"

  Cenario: Efetuar login com senha invalida
    Dado que eu acesso o site da creditas
    Quando eu preencher os dados do usuário corretos
    E eu prencho a senha incorreta
    Então eu verei a mensagem "Usuário ou senha invalidos"
