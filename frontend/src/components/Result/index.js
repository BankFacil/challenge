import React from "react";
import PropTypes from "prop-types";

import { Container, SubmitButton, Quota } from "./styles";

export default function Result({ onClick, rates, installmentAmount, totalAmount }) {
  totalAmount = parseFloat(totalAmount).toLocaleString("pt-BR", { minimumFractionDigits: 2, maximumFractionDigits: 2 });
  installmentAmount = parseFloat(installmentAmount).toLocaleString("pt-BR", {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2
  });
  return (
    <Container>
      <Quota>
        <h4>Valor da Parcela</h4>
        <div>
          <strong>R$</strong> <span>{installmentAmount}</span>
        </div>
      </Quota>
      <div>
        <h4>Total a pagar</h4>
        <p>R$ {totalAmount}</p>
      </div>
      <div>
        <h4>Taxa de juros (mês)</h4>
        <p>{rates}%</p>
      </div>
      <SubmitButton onClick={onClick}>Solicitar</SubmitButton>
    </Container>
  );
}

Result.propTypes = {
  onChange: PropTypes.func,
  totalAmount: PropTypes.number,
  installmentAmount: PropTypes.number,
  rates: PropTypes.number
};
