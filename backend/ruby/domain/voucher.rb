class Voucher
    attr_reader :value, :used

    def initialize(value)
        @value = value
        @used = false
    end

    def used?
        @used
    end
end