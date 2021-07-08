from unittest import TestCase, main
from customer import Customer


class TestCustomer(TestCase):
    def test_should_can_create_a_customer(self):
        customer = Customer(
            name='macabeus',
            wallet=100
        )

        assert customer.name == 'macabeus', 'Should set the same as "macabeus"'
        assert customer.wallet == 100, 'Should set the wallet as 100'
        assert len(customer.email_messages) == 0, \
            'Should not have any email messages'


if __name__ == '__main__':
    main()
