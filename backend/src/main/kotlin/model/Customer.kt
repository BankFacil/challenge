package challenge

class Customer(val email: String){

    fun addVoucher(discount: Double){
        print("\nVoucher $discount for $email")
    }
}