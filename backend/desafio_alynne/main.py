from customer import Customer
from address import Address
from payment import Payment
from product import Product
from creditCard import CreditCard
from order import Order

# teste com um cliente que possui filiação
# cliente com afiliação tem 10% de desconto no total da compra
cliente = {

"name": "alynne",

"cpf": "487845",

"zipcode": "04574",
"membership": {"membership_type" : 1}}

#Instanciando um cliente que possui filiação
print('Teste Cliente filiado 10\%\ de desconto')
foolano = Customer(cliente)
# criando um novo produto
produto = Product('Game of Trones',50,'comum_book')
# criando um novo pedido
order = Order(foolano,'08012')
# adicionando um produto
order.add_product(produto)
produto2 = Product('bela e a fera',30,'midia_digital')
order.add_product(produto2)
print('Valor total do pedido:', order.total_amount())

# cria um pagamento
attributes = dict(
    order= order,
    payment_method=CreditCard.fetch_by_hashed('43567890-987654367')
)
# endereço de cobrança
shipping_address = Address('90233')
payment = Payment(attributes=attributes)
payment.pay(shipping_address)
print('Valor do pagamento:')
print(payment.amount)

# começa os envios
if(payment.is_paid()):
  print('Métodos de envio')
  payment.order.send_orders()
else:
  pass
print('################################################')
# Teste sem desconto
cliente2 = {

"name": "alynne",

"cpf": "487845",

"zipcode": "04574"}
print('Teste Cliente normal')
foolano2 = Customer(cliente2)
# criando um novo produto
produto3 = Product('Game of Trones',50,'physical_item')
# criando um novo pedido
order2 = Order(foolano2,'08012')
# adicionando um produto
order2.add_product(produto3)
produto4 = Product('bela e a fera',30,'midia_digital')
order2.add_product(produto4)
print('Valor total do pedido:', order2.total_amount())

# cria um pagamento
attributes2 = dict(
    order= order2,
    payment_method=CreditCard.fetch_by_hashed('43567890-987654367')
)
# endereço de cobrança
shipping_address = Address('90233')
payment2 = Payment(attributes=attributes2)
payment2.pay(shipping_address)
print('Valor do pagamento:')
print(payment2.amount)

# começa os envios
if(payment2.is_paid()):
  print('Métodos de envio')
  payment2.order.send_orders()
else:
  pass