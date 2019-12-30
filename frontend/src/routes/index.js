import React from "react";
import { Switch } from "react-router-dom";
import Route from "./Route";
import Calculator from "../pages/Calculator";
import Help from "../pages/Help";

export default function Routes() {
  return (
    <Switch>
      <Route path="/" exact component={Calculator} />
      <Route path="/help" component={Help} />
    </Switch>
  );
}
