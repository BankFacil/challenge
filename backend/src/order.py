class Order(object):

    def __init__(self, customer):
        self.customer = customer
        self.items = []

    def add_items(self, product):
        self.items.append(product)
