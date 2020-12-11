package challenge

/**
 * Create a data class to store [name] and [email] of our customers
 */
data class Customer(val name : String, val email : String)

enum class MemberShipStatus {ACTIVE, INACTIVE}
class CustomerMembership(val customer : Customer, val membership: Membership, val status : MemberShipStatus)