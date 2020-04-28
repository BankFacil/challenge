class Product:

  name = None

  value = None

  productType = None

  def envia(self):
    pass
  

  def physical_item(self,func):
   
    def wrapper():
        print("Enviar para endereço")
        print('shipping label ')
        func()
    return wrapper

  def comum_book(self, func):
 
    def wrapper():
        print("Isento de imposto")
        func()
    return self.physical_item(wrapper)

  def digital_signature(self, func):
    def wrapper():
        print("Envia por e-mail")
        func()
    return wrapper

  def midia_digital(self, func):
    def wrapper():
        print("voucher de desconto de R$ 10 ")
        func()
    return self.digital_signature(wrapper)


 

  def __init__(self,name,value,productType ):

    self.name = name

    self.value = value

    self.productType = productType

    self.envia = getattr(self, productType)(self.envia)
