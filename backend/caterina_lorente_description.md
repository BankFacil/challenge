
# Celeritas Challenge


## Caterina Lorente Sancho-Miñana caterina.lorente@gmail.com


I have tried to tackle this challenge by following some of the SOLID principles as well as good Python practices (not because I didn't want to follow them'all!! :D but because the code did not allow for more, or at least I didn't see more opportunities :D) 


### Single Responsibility Principle

A class should have only one job and I have tried to architect them as such.


### Interface Segregation Principle

My biggest concern was how to deal with the different scenarios in a decoupled manner, so that if new products were added, the class in charge of their shipping rules
would still be like a box where, according to an input, would route to an output.

For that I have created a *class Dispatcher* with static methods.
This way the Dispatcher is independent and can be called right within the payment.pay() method, where all the necessary classes (Product, Order, Customer...) are available.


### Open-Closed Principle

The initial boilerplate contained a *class Product* that could not be closed against the different product types mentioned in the challenge.
My approach implies separate classes for each type of product ((Book, Item, Subscription and Media) that extend from the *Product* parent class and extend it as needed.


### Best practices

#### PEP 8 Use comparissons with 'is' or 'is not' instead of with equality operators when comparing with None

For example, self.paid_at is not None


#### PEP 3107 Use function annotations

Despite Python lacks the standard way of annotating function parameters, I consider that following this directive not only improves coding readability but also has several
fitting use cases mentioned [here](https://www.python.org/dev/peps/pep-3107/#use-cases)
Also there is a great [post](https://stackoverflow.com/questions/2489669/function-parameter-types-in-python) at StackOverflow going deeper on the matter.


#### Testing

A must :)
Please find attached a battery of tests that try to cover as many as I could think.
I am sure there could be way more to be added, but time was limited.


####  Attribute references vs Instantiation

Most of the classes in the Python boilerplate had class variables attributes that were also defined in the __init__ method for later instantiation.
For example,

class Invoice:
    billing_address = None
    shipping_address = None
    order = None

    def __init__(self, attributes={}):
    	self.billing_address = attributes.get('billing_address', None)
    	self.shipping_address = attributes.get('shipping_address', None)
    	self.order = attributes.get('order', None)

This doesn't make sense. If a variable is going to be unique to each instance better define it in the __init__, if it is going to be shared by all instances, then define
it outside the __init__

So I removed the class attributes that I considered where instance variables.


#### Cleaned-up classes

- Payment.pay() method was initializing attributes that could be done in the __init__ method

- Invoice class was using a bunch of attributes to be initialized that could be accessed by passing the Order object to it. 

- OrderItem class was using both self.order and self.product. I have refactored the code so that an Order references to an OrderItem, seemed like the natural flow. 

class OrderItem:
    def __init__(self, order, product):

 is now

 class OrderItem:
    def __init__(self, product):


#### Structure

Please find below an ASCII attempt :) to show the relationship between classes. Nevertheless the code is always the answer.

CreditCard

Dispatcher

Order
 -> Customer -> Address
 -> Product -> Book, Item, Subscription -> Membership, Media

 Payment
  <- Order
  <- CreditCard
  -> Invoice <- Order
  




