import React from "react";
import PropTypes from "prop-types";
import { Container, Main } from "./styles";
import Footer from "../../../components/Footer";
import Header from "../../../components/Header";

export default function DefaultLayout({ children }) {
  return (
    <Container>
      <Header />
      <Main>
        {children}
        <Footer />
      </Main>
    </Container>
  );
}

DefaultLayout.propTypes = {
  children: PropTypes.element.isRequired
};
