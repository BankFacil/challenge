from order import OrderItem, OrderTotal
from payment import Payment
from customer import Customer
from customer import CreditCard
from product import Product
from product import SenderOrder
from deliveryStrategy import BookType

def main():
# Book Example (build new payments if you need to properly test it)
    customerAtrr = {
        "customerName" : "Joao Pedro",
        "emailCustomer" : "joaopedro@gmail.com",
        "numberID" : "015324555",
        "zipCodeBilling" : "30124092", 
        "billingAddress" : "Rua do Carmo 192", 
        "zipCodeShipping" : "04058222", 
        "shippingAddress" : "Rua das Dores", 
        "discountFlag" : True,
        "creditCard" : "123454-334566"
    }
    customer1 = Customer(customerAtrr)
    orderitem1 = OrderItem(order = "StarWars", productType= "bookType", price = 22.50)
    orderitem2 = OrderItem(order = "Avengers", productType= "bookType", price = 35.50)
    orderitem3 = OrderItem(order = "Spider-Man", productType= "digitalType", price = 35.50)
    
    order = OrderTotal(customer1)
    order.putOnCart(orderitem1)
    order.putOnCart(orderitem2)
    order.putOnCart(orderitem3)

    payOrder = Payment(customer1, order)
    payOrder.pay()
    print(payOrder.isPaid())

#========##========##========##========##========##========##========##========##========##========##========##========#

if __name__ == "__main__":
    main()