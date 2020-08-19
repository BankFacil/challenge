Feature: Criar post via API
    Verificação do sucesso do envio de uma mensagem via POST

Scenario: Enviar mensagem via POST
    Given que uma mensagem é enviada via POST para a API JsonPlaceHolder
    Then devemos receber o código de sucesso
