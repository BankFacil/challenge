require_relative '../infrastructure/in_memory_orders'
require_relative '../infrastructure/console_printer'
require_relative '../infrastructure/console_mail_sender'
require_relative '../application/pay_order'
require_relative '../application/order_items'
require 'colorize'

credit_card_hash = '123'
customer_mail = "gimoteco@gmail.com"
items = [
    {"name" => "Harry Potter", "type" => "book"},
    {"name" => "broom", "type" => "physical_item"},
    {"name" => "premium account", "type" => "membership"},
    {"name" => "Despacito.mp3", "type" => "digital_media"},
]
in_memory_orders = InMemoryOrders.new
console_printer = ConsolePrinter.new
console_mail_sender = ConsoleMailSender.new
order_items = OrderItems.new(in_memory_orders)
pay_order = PayOrder.new(console_mail_sender, console_printer, in_memory_orders)

order = order_items.order(customer_mail, items)
pay_order.pay(order.id, credit_card_hash)

puts "Customer membership activated? #{order.customer.memberships[0].activated}".blue
puts "Customer voucher total value? #{order.customer.vouchers.map(&:value).inject(0, :+)}".blue