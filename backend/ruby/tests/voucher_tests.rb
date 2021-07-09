require 'test/unit'
require_relative '../domain/voucher';

class VoucherTests <  Test::Unit::TestCase
    VALUE = 10
    def test_a_voucher_should_have_a_value
        voucher = Voucher.new VALUE

        assert_equal VALUE, voucher.value
    end

    def test_a_voucher_should_be_initialized_unused
        voucher = Voucher.new VALUE

        assert_false voucher.used?
    end
end