module Products
  class Membership < Product
    def initialize(name, period = 1)
      super name
      @period = period
    end

    def prepare_delivery
      membership = Membership.new(self)
      membership.activate(@period)
      @customer.memberships.add(membership)
      
      send_details
    end
  end
end