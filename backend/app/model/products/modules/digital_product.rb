module DigitalProduct
  include Email

  def type
    ProductsType::MOVIE
  end

  def process customer
    voucher = get_voucher_to(customer)
    messa_email = "Your #{self.name} product is ready for download\n"
    message = "#{messa_email}#{voucher}"
    send_email(customer.email, message)
  end

  def get_voucher_to customer
  	discount = 10
  	voucher = Voucher.new(customer)
  	voucher.voucher_with(discount)
  end
end