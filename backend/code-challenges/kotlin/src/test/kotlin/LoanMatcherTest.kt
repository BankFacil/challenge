import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class LoanMatcherTest {

    @Test
    internal fun `returns personal loan when customer income is under 3000`() {
        val customer = Customer(3000)
        val loanMatcher = LoanMatcher(customer)
        val availableLoans: List<Loan> = loanMatcher.loans()

        assertThat(availableLoans.size).isEqualTo(1)

        assertThat(availableLoans.stream().findFirst().isPresent).isTrue
        assertThat(availableLoans[0].type()).isEqualTo("EMPRESTIMO_PESSOAL")
    }
}
