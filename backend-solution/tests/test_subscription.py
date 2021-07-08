from unittest import TestCase, main
from subscription import Subscriptions


class TestSubscription(TestCase):
    def test_should_can_create_and_get_a_subscription(self):
        Subscriptions().create('sub')

        assert Subscriptions().get('sub').name == 'sub', \
            'Should can create and get a subscription'


if __name__ == '__main__':
    main()
