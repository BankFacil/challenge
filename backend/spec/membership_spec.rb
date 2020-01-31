require_relative '../bootstrap'

describe 'Membership' do
    it 'knows customer email' do
        customer = Customer.new
        expect(Membership.new(customer).email).to be :email
    end
end