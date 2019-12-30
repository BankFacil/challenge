import React, { useState, useEffect } from "react";
import { Container, Section, Form, Fields, Group } from "./styles";

import Select from "../../components/Select";
import InputRange from "../../components/InputRange";
import Title from "../../components/Title";
import Result from "../../components/Result";
import { Rules, Simulator } from "../../services/";
export default function Calculator() {
  const [guarantee, setGuarantee] = useState("vehicle");
  const [times, setTimes] = useState([]);
  const [timeOption, setTimeOption] = useState([]);
  const [guaranteeValue, setGuaranteeValue] = useState(0);
  const [loanAmount, setLoanAmount] = useState(0);
  const [maxLoan, setMaxLoan] = useState(0);
  const [minLoan, setMinLoan] = useState(0);
  const [maxGuarantee, setMaxGuarantee] = useState(0);
  const [minGuarantee, setMinGuarantee] = useState(0);
  const [installmentAmount, setInstallmentAmount] = useState(0);
  const [totalAmount, setTotalAmount] = useState(0);
  const [rates, setRates] = useState(0);

  useEffect(
    () => {
      function calculate() {
        const result = Simulator.calculate(loanAmount, times);

        setTotalAmount(result.total);
        setInstallmentAmount(result.installment);
        setRates(result.rates);
      }
      calculate();
    },
    [times, loanAmount, installmentAmount, totalAmount]
  );

  useEffect(
    () => {
      const rules = Rules.get(guarantee, guaranteeValue);

      setMinGuarantee(rules.minGuarantee);
      setMaxGuarantee(rules.maxGuarantee);
      setTimeOption(rules.times);
      setMinLoan(rules.minLoan);
      setMaxLoan(rules.maxLoan);
    },
    [guarantee, guaranteeValue, loanAmount]
  );

  useEffect(
    () => {
      if (timeOption[0]) {
        setTimes(timeOption[0].value);
      }
    },
    [timeOption]
  );
  function handleResult(e) {
    e.preventDefault();
    return false;
  }
  return (
    <Container>
      <Title>Realize uma simulação de crédito utilizando seu bem como garantia.</Title>
      <Section>
        <Form onSubmit={handleResult}>
          <Fields>
            <Group>
              <Select value={times} onChange={setTimes} name="parcelas" options={timeOption} label="Número de parcelas" />
              <Select
                onChange={setGuarantee}
                name="garantia"
                value={guarantee}
                options={[{ name: "vehicle", value: "Veículo" }, { name: "realty", value: "Imóvel" }]}
                label="Garantia"
              />
            </Group>
            <InputRange
              onChange={setGuaranteeValue}
              name="valor-garantia"
              label="Valor da Garantia"
              min={minGuarantee}
              max={maxGuarantee}
              value={guaranteeValue}
            />
            <InputRange
              onChange={setLoanAmount}
              name="emprestimo"
              label="Valor do Empréstimo"
              min={minLoan}
              max={maxLoan}
              value={loanAmount}
            />
          </Fields>
          <Result installmentAmount={installmentAmount} rates={rates} totalAmount={totalAmount} onClick={handleResult} />
        </Form>
      </Section>
    </Container>
  );
}
