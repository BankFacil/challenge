require_relative '../bootstrap'

describe 'payment' do

    before(:each) do
        @customer = Customer.new
        @credit_card = CreditCard.fetch_by_hashed('43567890-987654367')
    end
    

    it 'allows to pay books with credit card' do
        book = Product.new( type: :book, name: 'Awesome book')
        book_order = Order.new(@customer)       
        paid = true

        book_order.add_product(book)
        payment_book = Payment.new(order: book_order, payment_method: @credit_card)
        payment_book.pay

        expect(payment_book.paid?).to be paid
        expect(payment_book.order.items.first.product.type).to be :book
    end

    it 'generates a shipping label if payment is for a physical item' do
        physical = Product.new(type: :physical, name: 'Awesome physical')
        physical_order = Order.new(@customer)       
        generate = true

        physical_order.add_product(physical)
        payment_physical = Payment.new(order: physical_order, payment_method: @credit_card)
        payment_physical.pay

        expect(payment_physical.result.shipping_label?).to be generate
    end

    it 'does not generate a shipping label if payment is for a non physical item' do
        digital = Product.new(type: :digital, name: 'Awesome digital')
        digital_order = Order.new(@customer)       
        not_generate = nil

        digital_order.add_product(digital)
        payment_digital = Payment.new(order: digital_order, payment_method: @credit_card)
        payment_digital.pay

        expect(payment_digital.result.shipping_label?).to be not_generate

    end

    it 'activate the subscription and notify the user to email if payment is a service subscription' do
        membership = Product.new(type: :membership, name: 'Awesome membership')
        membership_order = Order.new(@customer)       
        subscribed = true
        sended = true

        membership_order.add_product(membership)
        payment_membership = Payment.new(order: membership_order, payment_method: @credit_card)
        payment_membership.pay

        expect(payment_membership.result.membership.subscription?).to be subscribed
        expect(payment_membership.result.membership.subscription_email?).to be sended
    end
    it 'does not activate the subscription and does not notify the user to email if payment is a service subscription' do
        book = Product.new(type: :book, name: 'Awesome membership')
        book_order = Order.new(@customer)       
        not_subscribed = nil
        not_sended = nil

        book_order.add_product(book)
        payment_book = Payment.new(order: book_order, payment_method: @credit_card)
        payment_book.pay

        expect(payment_book.result.membership.subscription?).to be not_subscribed
        expect(payment_book.result.membership.subscription_email?).to be not_sended
    end
    it 'generate shipping label with notification if payment is a ordinary book' do
        ordinarybook = Product.new( type: :ordinarybook, name: 'Awesome book')
        ordinarybook_order = Order.new(@customer)       
        notificated = true

        ordinarybook_order.add_product(ordinarybook)
        payment_ordinarybook = Payment.new(order: ordinarybook_order, payment_method: @credit_card)
        payment_ordinarybook.pay

        expect(payment_ordinarybook.result.notification?).to be notificated
        expect(payment_ordinarybook.result.show_notification).to include('150')
    end

    it 'does not generate shipping label with notification if payment not is a ordinary book' do
        book = Product.new( type: :book, name: 'Awesome book')
        book_order = Order.new(@customer)       
        not_notificated = nil

        book_order.add_product(book)
        payment_book = Payment.new(order: book_order, payment_method: @credit_card)
        payment_book.pay

        expect(payment_book.result.notification?).to be not_notificated
    end

    it 'send the description of the purchase by email' do
        media = Product.new( type: :media, name: 'Awesome book')
        media_order = Order.new(@customer)       
        media_order.add_product(media)
        media_book = Payment.new(order: media_order, payment_method: @credit_card)
        media_book.pay

        expect(media_book.result.purchase_send).to be :description
    end
    it 'send the description of the purchase by email if payment is a media' do
        media = Product.new( type: :media, name: 'Awesome book')
        media_order = Order.new(@customer)       
        sended = true

        media_order.add_product(media)
        payment_media = Payment.new(order: media_order, payment_method: @credit_card)
        payment_media.pay

        expect(payment_media.result.purchase_sended?).to be sended
    end
    it 'does not send the description of the purchase by email if payment is a book' do
        book = Product.new( type: :book, name: 'Awesome book')
        book_order = Order.new(@customer)       
        not_sended = nil

        book_order.add_product(book)
        payment_book = Payment.new(order: book_order, payment_method: @credit_card)
        payment_book.pay

        expect(payment_book.result.purchase_sended?).to be not_sended
    end
    it 'apply a discount of $ 10 if payment is a media' do
        media = Product.new( type: :media, name: 'Awesome book')
        media_order = Order.new(@customer)       
        total = 0

        media_order.add_product(media)
        payment_media = Payment.new(order: media_order, payment_method: @credit_card)
        payment_media.pay

        expect(payment_media.final_price).to be total
    end
    it 'does not apply a discount of $ 10 if payment is a book' do
        book = Product.new( type: :book, name: 'Awesome book')
        book_order = Order.new(@customer)       
        total = 10

        book_order.add_product(book)
        payment_book = Payment.new(order: book_order, payment_method: @credit_card)
        payment_book.pay

        expect(payment_book.final_price).to be total
    end
end
