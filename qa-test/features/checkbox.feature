Feature: Adionar e remover o checkbox
    Verificação da adição e remoção de um checkbox

    
@remover
Scenario: Remover checkbox
    Given que estou na página "dynamic_controls"
    When clico no botão "Remove"
    Then o checkbox é removido 
    And  a mensagem "It's gone!" aparece


@adicionar
Scenario: Adicionar checkbox
    Given que estou na página "dynamic_controls" sem checkbox
    When clico no botão "Add"
    Then o checkbox é adicionado
    And  a mensagem "It's back!" aparece

