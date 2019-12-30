import React, { useState, useEffect } from "react";

import PropTypes from "prop-types";
import { Container } from "./styles";

export default function Select({ name, options, onChange, label, value }) {
  const [selectValue, setSelectValue] = useState(value);

  useEffect(
    () => {
      onChange(selectValue);
    },
    [selectValue]
  );
  function handleSelectChange(e) {
    const v = e.target.value;
    setSelectValue(v);
  }
  // console.log(options);

  return (
    <div className="field">
      <label htmlFor={name}>{label}</label>
      <select name={name} id={name} onChange={handleSelectChange} required>
        {options.map(item => (
          <option defaultValue={item.name == selectValue} key={item.name} value={item.name}>
            {item.value}
          </option>
        ))}
      </select>
    </div>
  );
}
Select.propTypes = {
  onChange: PropTypes.oneOfType([PropTypes.func]),
  name: PropTypes.number,
  label: PropTypes.string,
  options: PropTypes.array,
  value: PropTypes.any,
  name: PropTypes.string
};
