Feature: Payment Items

    Scenario: Physical Product
        Given a Physical product
        And add product to a order
        When Pay order
        Then I should see Generate a Shipping label info

    Scenario: Subscription
        Given a Subscription
        And add product to a order
        When Pay order
        Then I should see Notify email info 
        And Activate Subscription

    Scenario: Book
        Given a Book
        And add product to a order
        When Pay order
        Then I should see Generate a Shipping label isento de impostos conforme disposto na Constituicao Art. 150, VI, d.

    Scenario: Midia
        Given a Midia
        And add product to a order
        When Pay order
        Then I should see Notify email with a voucher 