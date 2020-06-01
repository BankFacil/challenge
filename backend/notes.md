I tried to keep things as simple as possible.

I just complete the gaps.
I decided to create a function within the order class that's called ship, this is executed right away they payment is made (paid).

This function is the one that for each product in the order, redirects to the proper fucntion according to the product type. Each of this functions handles all the shipping rules.

I added a shipping box list, to added all the labels that were created.
I added an attribute value, to the product class, to handle the pricing.
I decide to handle the disscount rule, by generating a code and send it via email.

I didn't want to complicate the membership class, so I just added a function to activate it, for the moment it only send a mail.

Probabbly, it will be a smart choice to do something more in the memebership class and it will probabbly be wise to do a class to handle the subscription to do something more.

I added some tests
- A simple test for the customer.

Two test for the order class:
- To test the total amount of the products.
- To test that all products were added.

Three test for the payment
- To test that the payment has been made.
- To test that the shipping box, has some labels
- To test that the first label is also tax exempted.
