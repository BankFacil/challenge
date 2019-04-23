export const defaultPage = `
<form class="form" name="form">
  <div class="form__fields">
    <div class="field-group">
      <div class="field">
        <label for="parcelas">Número de parcelas</label>
        <select name="parcelas" id="parcelas" required>
          <option value="24">24</option>
          <option value="36">36</option>
          <option value="48">48</option>
        </select>
      </div>
      <div class="field">
        <label for="garantia">Garantia</label>
        <select name="garantia" id="garantia" required>
          <option value="vehicle">Veículo</option>
          <option value="realty">Imóvel</option>
        </select>
      </div>
    </div>
    <div class="valor-garantia">
      <div class="field-group">
        <div class="field">
          <label for="valor-garantia">Valor da Garantia</label>
          <input type="text" required name="valor-garantia" id="valor-garantia" value="R$ 123.455,00" />
        </div>
        <div class="field">
          <div class="range">
            <input type="range" name="valor-garantia-range" id="valor-garantia-range" min=3750 max=9000000 value=123455 step="100" />
            <div class="range__values">
              <span>R$ 3.750,00</span>
              <span>R$ 9.000.000,00</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="emprestimo">
      <div class="field-group">
        <div class="field">
          <label for="valor-emprestimo">Valor do Empréstimo</label>
          <input type="text" required name="valor-emprestimo" id="valor-emprestimo" value="R$ 90.455,00" />
        </div>
        <div class="field">
          <div class="range">
            <input type="range" name="valor-emprestimo-range" id="valor-emprestimo-range" min=3000 max=100000 value=90455 step="100" />
            <div class="range__values">
              <span>R$ 3.000,00</span>
              <span>R$ 100.000,00</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="form__result">
    <div class="quota__container">
      <h4>Valor da Parcela</h4>
      <div class="quota">
        <strong>R$</strong>
        <span>465,00</span>
      </div>
    </div>
    <div class="amount_container">
      <h4>Total a pagar</h4>
      <p>R$ 11.112,00</p>
    </div>
    <div class="tax__container">
      <h4>Taxa de juros (mês)</h4>
      <p>111,12%</p>
    </div>
    <button class="button">
      Solicitar
    </button>
  </div>
</form>
`

export const simplePage = `
    <form class="form" data-testid="form">
    <div class="field">
      <label for="parcelas">Número de parcelas</label>
      <select name="parcelas" id="parcelas" required>
        <option value="24">24</option>
        <option value="36">36</option>
        <option value="48">48</option>
      </select>
    </div>
      <label for="valor-garantia">Valor da Garantia</label>
      <input id="valor-garantia" required value='R$ 123.455,00'/>
      <label for="valor-emprestimo">Valor da Garantia</label>
      <input id="valor-emprestimo" required value='R$ 123.455,00'/>
      <button type="button"></button>
    </form>
  `
