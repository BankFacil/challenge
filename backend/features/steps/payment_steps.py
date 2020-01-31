from behave import *
from bootstrap import * 

@given(u'a Physical product')
def step_impl(context):
    context.product = Physical("Physical")

@given(u'a Subscription')
def step_impl(context):
    context.product = Subscription("Subscription")

@given(u'a Book')
def step_impl(context):
    context.product = Book("Book")

@given(u'a Midia')
def step_impl(context):
    context.product = Midia("Midia")

@given(u'add product to a order')
def step_impl(context):
    context.order = Order(Customer("email"))
    context.order.add_product(context.product)

@when(u'Pay order')
def step_impl(context):
    context.payment = Payment(dict(order=context.order))
    context.payment.pay()

@then(u'I should see Generate a Shipping label {expected}')
def step_impl(context,expected):
    assert(PrinterQueue.queue[0].information == expected)
    PrinterQueue.queue.remove(PrinterQueue.queue[0])

@then(u'I should see Notify email {expected}')
def step_impl(context,expected):
    assert(EmailQueue.queue[0].message == expected)
    EmailQueue.queue.remove(EmailQueue.queue[0])

@then(u'Activate Subscription')
def step_impl(context):
    assert(context.order.customer.email == User.users[0].login)
    assert(User.users[0].active)
    User.users.remove(User.users[0])
    