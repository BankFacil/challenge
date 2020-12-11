import abc


class PaymentMethod(abc.ABC):
    @abc.abstractmethod
    def fetch_by_hash(self, code):
        pass


class CreditCard(PaymentMethod):
    def fetch_by_hash(self, number):
        return number
