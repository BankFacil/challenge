# language: pt

Funcionalidade: Nova Aba

Crie um cenário de teste automatizado que clique no link
e valide que a outra aba foi aberta corretamente.

Cenário: Abrir nova aba
    Dado que o usuário está na tela principal
    Quando tocar no botão Click Here
    Então visualiza a tela com mensagem da nova aba
