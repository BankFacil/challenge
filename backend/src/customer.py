class Customer:

    def __init__(self, name, email):
        self.name = name
        self.email = email
        self.__subscriber = False
        self.__voucher = 0

    @property
    def subscriber(self):
        return self.__subscriber

    @subscriber.setter
    def subscriber(self, value):    
        self.__subscriber = value

    @property
    def voucher(self):
        return self.__voucher

    @voucher.setter
    def voucher(self, value):    
        self.__voucher = value
