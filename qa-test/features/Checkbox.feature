# language: pt

Funcionalidade: Adicionar/Remover Checkbox

Cenário: Remover Checkbox
    Dado que o usuário está na página do Checkbox
    Quando tocar no botão Remove
    Então visualiza a mensagem de remoção sucesso


Cenário: Adicionar Checkbox
    Dado que o usuário está na página do Checkbox desabilitado
    Quando tocar no botão Add
    Então visualiza a mensagem de adicionado sucesso
