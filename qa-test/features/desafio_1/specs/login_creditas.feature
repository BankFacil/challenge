#language:en

@creditas_system @consult_solicitation
Feature: Feature to consult a solicitation of a loan made it by a customer

Background: User registered and on the login main screen
    Given that i'm a user previously registered on system
    And on the login main screen of system
#----------
@scenario_consult_solicitation_1
Scenario: Login with CPF and password valid
    When type on field login the CPF "127.434.870-62"
    And type on field senha the value "senha_valida_creditas"
    And click on "ENTRAR" button
    Then i do it login successfully on system
#----------
@scenario_consult_solicitation_2
Scenario: Login with e-mail and password valid
    When type on field login the email "mail_valido@creditas.com.br"
    And type on field senha the value "senha_valida_creditas"
    And click on "ENTRAR" button
    Then i do it login successfully on system
#----------
@scenario_consult_solicitation_3
Scenario: Login with CPF invalid and password valid
    When type on field login the CPF "999.999.999-99"
    And type on field senha the value "senha_valida_creditas"
    And click on "ENTRAR" button
    Then a message of notification is showed saying "Email ou CPF inválido"
    And i do not login successfully on system
#----------
@scenario_consult_solicitation_4
Scenario: Login with e-mail invalid and password valid
    When type on field login the email "mail_invalido@creditas.com.br"
    And type on field senha the value "senha_valida_creditas"
    And click on "ENTRAR" button
    Then a message of notification is showed saying "Email ou CPF inválido"
    And i do not login successfully on system
#----------
@scenario_consult_solicitation_5
Scenario: Login with CPF valid and password invalid
    When type on field login the CPF "127.434.870-62"
    And type on field senha the value "senha_invalida_creditas"
    And click on "ENTRAR" button
    Then a message of notification is showed saying "Senha Inválida"
    And i do not login successfully on system
#----------
@scenario_consult_solicitation_6
Scenario: Login with e-mail valid and password invalid
    When type on field login the email "mail_valido@creditas.com.br"
    And type on field senha the value "senha_invalida_creditas"
    And click on "ENTRAR" button
    Then a message of notification is showed saying "Senha Inválida"
    And i do not login successfully on system
#----------
@scenario_consult_solicitation_7
Scenario: User that needs help
    When click on "AJUDA" button
    Then i'm redirected to the screen of Help
#----------
@scenario_consult_solicitation_8
Scenario: User that forgot the password
    When click on "ESQUECEU A SENHA?" link
    Then i'm redirected to the screen of password redefinition
#----------