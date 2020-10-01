# language: pt
@checkbox
Funcionalidade: Adiconar e remover checkbox
  Eu como desafiado
  Quero adcionar e remover o botão checkbox
  Para concluir o desafio

  Cenário: Remover botão checkbox
    Dado que eu acesso o link do desafio
    Quando eu clicar em remover
    Então eu verei a mensagem "It's gone!"

  Cenário: Adicionar botão checkbox
    Dado que eu acesso o link do desafio
    Quando eu clicar em adicionar
    Então eu devo visializar o botão "A checkbox"
