from address import Address

class Invoice:
    shipping_address = None
  

    def __init__(self, attributes={}):
        self.shipping_address = attributes.get('shipping_address', None)