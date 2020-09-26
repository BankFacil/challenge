Feature: Log in Creditas website
  As a Creditas customer
  I want to be able to access my Creditas personal page
  And use my CPF or e-mail to get it
  And be able to recover my password
  Then I may get the lowest market interest

  Scenario: Login successfully with CPF
    Given I am in Creditas website
    And click on 'Entrar' link
    And type a valid CPF
    And type a valid password
    And click on 'Entrar' button
    Then I should see the land page

  Scenario: Login successfully with e-mail
    Given I am in Creditas website
    And click on 'Entrar' link
    And type a valid e-mail
    And type a valid password
    And click on 'Entrar' button
    Then I should see the land page

  Scenario: Password Recovery
    Given I am in Creditas website
    And click on 'Entrar' link
    And click on 'Esqueceu a senha'
    And type a valid e-mail
    And click on 'Recuperar a senha' button
    Then I should see a confirmation message
