import styled from "styled-components";

export const Container = styled.div``;
export const Form = styled.form`
  display: flex;
  justify-content: space-around;
  margin-bottom: 50px;
  > div {
    width: 100%;
  }
  @media screen and (max-width: 630px) {
    flex-direction: column;
    align-items: center;
  }
`;
export const Section = styled.section``;
export const Fields = styled.div`
  max-width: 400px;
  min-width: 400px;
  @media screen and (max-width: 630px) {
    min-width: 100%;
    margin-bottom: 30px;
  }
`;
export const Group = styled.div`
  display: flex;
  margin-bottom: 30px;
  div:first-child {
    margin-right: 30px;
  }
`;
