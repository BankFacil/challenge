package challenge.product

import email.Email
import membership.Membership
import shipping.DataShippingLabel
import kotlin.random.Random

enum class ProductType {
    PHYSICAL(){
        override fun execute(nome:String, qtd:Int, total:Double): Execution {
            //logic
            val shippingLabel = DataShippingLabel(Random.nextInt(1, 1000).toLong())
            return Execution(shippingLabel.id,null,null)
        }
    },
    BOOK(){
        override fun execute(nome:String, qtd:Int, total:Double): Execution {
            //logic
            val shippingLabel = DataShippingLabel(Random.nextInt(1, 1000).toLong())
            val message = "Item isento de impostos conforme disposto na Constituição Art. 150, VI, d."
            return Execution(shippingLabel.id,null,message)
        }
    },
    DIGITAL() {
        override fun execute(nome:String, qtd:Int, total:Double): Execution {
            //logic
            val message = "Compra Digital: $nome. Valor Total $total"
            val emailStatus = Email(message).sendMail()
            return Execution(null,emailStatus,message)
        }

        override fun checkDiscount(): Double {
            return 10.0
        }
    },
    MEMBERSHIP(){
        override fun execute(nome:String, qtd:Int, total:Double): Execution {
            //logic
            val activateService = Membership().activateService()
            val message = if(activateService) "Serviço $nome ativado" else "Falha na ativação do servico $nome, consulte termos e condições"
            val emailStatus = Email(message).sendMail()
            return Execution(null,emailStatus,message)
        }

    };

    abstract fun execute(nome:String, qtd:Int, total:Double): Execution

    open fun checkDiscount(): Double {
        return 0.0
    }

}
data class Execution(
    val shippingLabelId: Long?,
    val emailStatus: Boolean?,
    val notification: String?
)