import { createGlobalStyle } from "styled-components";
import { colors } from "./index";
export default createGlobalStyle`
@import url('https://fonts.googleapis.com/css?family=Ubuntu:400,700&display=swap');
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Ubuntu';
}

html, body {
  height: 100%;
}
body {
  background-color: ${colors.concrete};
}
#app{
  height:100%;
}
.field-group {
    display: flex;
    margin-bottom: 30px;
}
.field-group .field:first-child {
    margin-right: 30px;
}
.field {
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.field label {
  color: ${colors.doveGray};
  font-weight: bold;
  font-size: .8rem;
  margin-bottom: 5px;
}
.field select {
  border:none;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  -ms-appearance: none;
}
.field select, .field input[type="text"] {
  color: ${colors.emperor};
  border: 1px solid ${colors.nobel};
  background-color: ${colors.alabaster};
  border-radius: 4px;
  padding: 10px 5px;
  width: 150px;
}
`;
