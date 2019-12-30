export default class Simulator {
  static iof = 6.38;
  static rates = 2.34;
  static calculate(amount, times) {
    //Validar

    const iof = this.iof;
    const rates = this.rates;

    const total = (iof / 100 + rates / 100 + times / 1000 + 1) * amount;
    const installment = total / times;
    return { total, installment, iof, rates, times, amount };
  }
}
