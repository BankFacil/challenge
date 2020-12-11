### Explicação sobre a minha solução

Enquanto eu estava lendo a descrição do desafio que vocês proporam, eu notei que poderia fazer algo parecido com uma divisão em camadas. Utilizando um pouco do que eu connheço sobre Domain Driven Design (DDD).
Essa solução em si não está perfeita igual descrita nos livros e tudo mais, se realmente fosse aplicar algo assim, levaria muito mais tempo.

Tentei encontrar as entidades que o sistema possuia, dentre elas: Payment, Customer, Order, OrderItem, Subscription, etc...

Olhando o código que foi feito no arquivo em bootstrap, notei o total encadeamento do sistema. Tendo várias funções delegadas para uma única entidade em si (Order)
Pensando nisso, separei em duas camadas, a camada de entidades, e a camada de data

Na de entidades, vocês vão notar que temos as entidades descritas. Algumas interfaces que foram usadas, e um ValueObject (Address).

Tentei utilizar grande parte de interfaces, para poder ter um desacoplamente maior e também uma maior testabilidade. Se forem notar, algumas logicas em si, parecem estar na entidade de Order, porém, quando estou dentro da entidade de order, utilizando as mesmas entidades que já foram criadas no sistema, eu passo para elas fazerem as logicas de seus metodos. Por exemplo, quando vou efetivar uma ativação de subscription, eu chamo a entidade de customer que possui um vinculo com subscriptions, e a partir dela, eu chamo subscrition e executo o metodo de ativar a inscrição

A camada de Data, seria uma camada basicamente de banco de dados. É nela que eu coloco as logicas de enviar email e de gerar uma shipping label. Tecnicamente falando, a camada de data é onde temos o acesso a coisas fora de nossa solução (banco de dados por exemplo). Por isso, pensei em usar isso para pode enviar o email e gerar o shipping

Eu me perdi um pouco na hora de criar a parte do voucher. Não sabia realmente criaria uma entidade, ou se faria só o desconto direto no metodo. Bom, eu segui a segunda opção kkk

Eu não fiquei tão preocupado em fazer o projeto funcionar, estou realmente mais interessado em como vocês entendam meu raciocinio, do que no projeto em si

Muitoo obrigado por terem me dado essa oportunidade. Espero o feedback de vocês, sendo ele bom ou ruim. E peço desculpas, sei que tenho até dia 15 para entregar e tentar fazer o melhor possível, mas estou extremamente atarefado no meu trabalho.