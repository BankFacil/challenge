## Levantamento de Requisitos - Página de Login

**Desenvolvimento da página de login da CREDITAS**

1. Contextualização

       - A página de login deverá conter:

```
       Uma header com o logo da CREDITAS no canto superior esquerdo;
       E no canto superior direito deverá conter um link chamado "AJUDA";
       Um título no formulário com os dizeres "Entre para ver a sua solicitação de empréstimo";
       Um campo para o preenchimento do CPF ou EMAIL;
       Um campo para o preenchimento da SENHA;
       Um botão "ENTRAR";
       E um link com os frase "ESQUECEU A SENHA?".
```
2. Regras

```
       2.1. O logo da CREDITAS deverá redirecionar para a HOME PAGE do site;
       
       2.2. O link AJUDA deverá redirecionar para página de AJUDA do site;
       
       2.3. O formulário e os elementos html que estarão dispostos dentro do
       mesmo deverão estar --> (alinhados, centralizados na página);
       
       2.4. O campo de preenchimento de CPF / EMAIL deverá aceitar
       os símbolos (apenas @, _, ., -) e alfanuméricos.
       
       2.5. Se preenchido com CPF, apenas 11 dígitos, e uma máscara de CPF
       deverá ser aplicada;
       
       2.6. Se for preenchido com EMAIL, deverá ter o padrão nome@domínio;
       
       2.7. Verificar se o EMAIL é preenchido com nome+123@domínio, se for
       um EMAIL com o sinal (+), invalidar;
       
       2.8. A senha deverá possuir pelo menos 1 dígito, 1 letra maiúscula e
       1 símbolo. O tamanho não poderá ser maior do que N caracteres;

       2.9. Ao clicar em ENTRAR, o usuário só poderá ter o acesso à plataforma se:
       O CPF ou EMAIL estiverem corretos, senão um alerta de CPF ou EMAIL
       inválido deverá ser disparado;

       2.10. O mesmo para SENHA, mas nesse caso o alerta será de "Senha Inválida!";

       2.11. Caso ele esqueça de preencher algum campo, um alerta de falta de 
       preenchimento deverá ser apresentado. A ordem de precedência é o
       CPF ou EMAIL, depois SENHA;

       2.12. Caso ele tente preencher os campos com caracteres não permitidos,
       bloquear com uma máscara o preenchimento;

       2.13. Caso ele clique no link "Esqueceu a Senha?", ele deverá ser
       redirecionado para a página de recuperação ou troca de senha.
```
## [Ir para o README](../README.md)