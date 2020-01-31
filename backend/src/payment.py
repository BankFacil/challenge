class Payment:

    def __init__(self, order):
        self.__order = order
        self.__is_paid = False

    def pay(self):
        self.__is_paid = True

    @property
    def is_paid(self):
        return self.__is_paid
