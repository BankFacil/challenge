import React, { useState, useEffect } from "react";
import PropTypes from "prop-types";

import { Container, Range } from "./styles";

function InputRange({ onChange, name, value, min, max, label, ...rest }) {
  const step = (max - min) / 10;
  const [rangeValue, setRangeValue] = useState(value);

  useEffect(
    () => {
      onChange(rangeValue);
    },
    [rangeValue]
  );
  function handleRangeChange(e) {
    const v = e.target.value;
    setRangeValue(v);
  }
  return (
    <Container>
      <div className="field-group">
        <div className="field">
          <label htmlFor={name}>{label}</label>
          <input type="text" readOnly={true} required name={name} id={name} value={rangeValue} />
        </div>
        <div className="field">
          <Range className="range">
            <input
              onChange={handleRangeChange}
              type="range"
              name={`${name}-range`}
              id={`${name}-range`}
              max={max}
              min={min}
              step={step}
              value={rangeValue}
            />
            <div>
              <span>{min}</span> <span>{max}</span>
            </div>
          </Range>
        </div>
      </div>
    </Container>
  );
}

InputRange.propTypes = {
  label: PropTypes.string,
  onChange: PropTypes.func,
  name: PropTypes.string,
  value: PropTypes.number,
  min: PropTypes.number,
  max: PropTypes.number
};

export default InputRange;
