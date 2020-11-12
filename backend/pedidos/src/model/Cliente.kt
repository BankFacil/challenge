package model

data class Cliente(val nome: String, val email: String, val endereco: Endereco){
    var assinatura : Boolean = false
}