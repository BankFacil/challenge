import vehicle from "./vehicle";
import realty from "./realty";
export default class Rules {
  static item = {};
  static amount = 0;
  static get(type, amount) {
    this.item = {};
    this.amount = Number(amount);
    switch (type) {
      case "vehicle":
        this.item = vehicle;
        break;
      case "realty":
        this.item = realty;
        break;
      default:
        return;
    }
    this.calculateGuarantee();
    this.calculateLoanLimit();
    return this.item;
  }
  static calculateLoanLimit() {
    this.item.maxLoan = this.item.maxLoanDefault;
    if (this.amount != 0) {
      const maxLoan = parseInt((this.amount / 10) * 8.4);
      if (this.item.maxLoan > maxLoan) {
        this.item.maxLoan = maxLoan;
      }
    }
    this.item.minLoan = this.item.minLoanDefault;
  }
  static calculateGuarantee() {
    this.item.maxGuarantee = this.item.maxLoanDefault * 1.2;
    this.item.minGuarantee = this.item.minLoanDefault * 1.2;
  }
}
