import styled from "styled-components";

export const Container = styled.div`
  height: 100%;
`;
export const Main = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: calc(100% - 80px);
  padding: 0 10px;
  @media screen and (max-width: 630px) {
    height: auto;
    margin: 30px 0;
  }
`;
