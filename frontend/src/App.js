import React from "react";
import GlobalStyle from "./styles/global.js";

import Routes from "./routes";
import { Router } from "react-router-dom";

import { createBrowserHistory } from "history";

const history = createBrowserHistory();

export default function App() {
  return (
    <>
      <GlobalStyle />
      <Router history={history}>
        <Routes />
      </Router>
    </>
  );
}
