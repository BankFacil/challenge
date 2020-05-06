module Products
  class Digital < Product
    def prepare_delivery
      @customer.add_voucher(Voucher.new(10))
      send_details
    end
  end
end