from dispatcher import Physical_dispatcher, Digital_dispatcher, Membership_dispatcher

class Product:

    def __init__(self, name, category):
        self.name = name
        self.category = category

    def identifying_physical(self):
        return Physical_dispatcher() '''how?'''

    def identifying_digital(self):
        return Digital_dispatcher

    def identifying_membership(self):
        return Membership_dispatcher