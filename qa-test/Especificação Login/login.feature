Feature: login
    Validar  funcionalidade area logada no site creditas


    Scenario Outline: Validar login com dados validos - email
        Given que desejo efetuar login
        When informo  os campos  <email> e <senha>
        And clico na opção entrar
        Then e apresentado area logada ao usuario

        Examples:
            | email     | senha      |
            | "usuario" | "Credit@s" |

    Scenario Outline: Validar login com dados validos - cpf
        Given que desejo efetuar login
        When informo  os campos  <cpf> e <senha>
        And clico na opção entrar
        Then e apresentado area logada ao usuario

        Examples:
            | cpf           | senha      |
            | "37075094866" | "Credit@s" |


    Scenario Outline: Validar login com dados invalidos - Email
        Given que desejo efetuar login
        When informo  os campos  <email> e <senha>
        And clico na opção entrar
        Then e apresentado  <msg> informando que email invalido

        Examples:
            | email           | senha      | msg                              |
            | "teste@teste  " | "Credit@s" | "Email informado não encontrado" |

    Scenario Outline: Validar login com dados invalidos - cpf
        Given que desejo efetuar login
        When informo  os campos  <cpf> e <senha>
        And clico na opção entrar
        Then e apresentado  <msg> informando que cpf invalido

        Examples:
            | cpf           | senha      | msg                            |
            | "99999999999" | "Credit@s" | "Cpf informado não encontrado" |

    Scenario Outline: Validar login com dados invalidos - Senha
        Given que desejo efetuar login
        When informo  os campos  <cpf> e <senha>
        And clico na opção entrar
        Then e apresentado area <msg> informando que senha esta incorreta

        Examples:
            | cpf           | senha     | msg              |
            | "99999999999" | "1111111" | "Senha invalida" |

    Scenario: Validar link esqueci minha senha
        Given que desejo efetuar recuperar meu login de acesso
        When clico mo link esqueci minha senha
        Then e apresentado opções para recuperar login de acesso









