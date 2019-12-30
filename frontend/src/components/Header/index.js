import React from "react";
import { Link } from "react-router-dom";

import { Wrapper, Container, Title, Logo } from "./styles";

export default function Header() {
  return (
    <Wrapper>
      <Container>
        <Title>
          <Link to="/">
            <Logo
              className="logo"
              src="https://staging.creditas.com.br/static/images/logo-creditas-white-3cd22a2808.svg"
              alt="Creditas"
            />
          </Link>
        </Title>
        <Link to="/help">Ajuda</Link>
      </Container>
    </Wrapper>
  );
}
