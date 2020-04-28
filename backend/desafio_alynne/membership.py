import datetime

class Membership() :

  membership_type = None
  discount_value = 0
  expiration_date = datetime.datetime(2019, 2, 28)



  def __init__(self, attributes):

    # por enquanto só tem um
    self.membership_type = attributes.get('membership_type')
    self.discount_value = 0.1
  