import styled from "styled-components";
import { colors } from "../../styles/index";

export const Wrapper = styled.header`
  background-color: ${colors.mountainMeadow};
  padding: 20px 0;
`;

export const Container = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 80%;
  margin: 0 auto;
  a {
    text-decoration: none;
    color: ${colors.concrete};
  }
`;

export const Title = styled.h1``;
export const Logo = styled.img`
  height: 1em;
`;
