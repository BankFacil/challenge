
@checkbox
Feature:Checkbox
    Validar se checkbox  foi adicionado corretamente no site

  
    Scenario: Validar inclusão de checkbox
        Given que  estou na home page do site Dynamic Controls
        When seleciono a opção incluir checkbox
        Then  checkbox e adicionado com sucesso

  @validar
    Scenario: Validar remoção de checkbox
        Given que  estou na home page do site Dynamic Controls
        When seleciono a opção remover checkbox
        Then  checkbox e removido com sucesso



