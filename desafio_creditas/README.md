# Desafio Creditas

## **Dependências**

      * RVM
      * Ruby 2.4.1

## **Instruções de Instalação**

Instalar bundler
Instalar RVM

 - **Instalando bundler**
    $ gem install bundler

 - **Instalando RVM**
      $ \curl -sSL https://get.rvm.io | bash

      *Mais informações: https://rvm.io/rvm/install*

## **Opções**

> **Ambientes de execução**
>
    * ENV - Em qual ambiente será executado o teste
      * prod

## **Tags:**

 - `@checkbox` - Executa todos os cenários do checkbox
     - `@nova_aba` - Executa todos os cenários da nova aba
     - `@login_creditas` - Executa todos os cenários do login creditas
     - `@api` Executa todos os cenários da api


## **Exemplo de execução:**

    $ ENV=prod cucumber -t @checkbox
