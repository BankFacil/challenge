Challenge solution summary
==========

### Esplanação

Resolvi criar uma aplicação REST para simular maior realidade. A idéia foi modular com intuito de organizar para uma futura necessidade de crescimento bem como a realização de testes.

#### Árvore
```
src/
 |___main.py
 |___log.py
 |___error.py
 |
 |___/controller/
 |		|___controller.py
 |		|___helper.py
 |		|___test_helper.py
 |
 |__/usecase/
 |		|___usecase.py
 |		|___payment.py
 |		|___test_payment.py
 |		|___service.py
 |
 |__/repository/
 |		|___repository.py
 |
 |__/entity/
		|___entity.py
```

#### Módulos

##### Raiz
No diretório raiz ficaram os arquivos main.py, log.py e error.py.
	- main.py tem a unica responsabilidade de iniciar a aplicação.
	- log.py tem a responsabilidade de configurar o output de logs.
	- error.py serve para customizar erros classificados como side server e client server.


##### Controller
Em controller.py eu utilizei o framework [CherryPy](https://cherrypy.org/), que tem a única responsabilidade de administrar as requisições http, ele não interfere em nada quanto as regras do negócio.

Cherrypy é um framework minimalista voltado apenas ao empacotamento do protocolo HTTP baseado na normas da RFC.

O controller apenas inicia o servidor bem como as rotas.

POST: Permite realizar um novo pagamento.
```
http://localhost:51234/service/pay
```

GET: Obtem os dados das assinaturas.
```
http://localhost:51234/service/membership
```

O restante a aplicação utiliza apenas código nativo da linguagem.

O helper.py faz a validação das requisições recebidas antes de serem enviadas aos casos de uso.
O test_helper contém os testes unitários para a classe Helper.


##### Usecase
O arquivo usecase.py serve como um interador entre o módulo de controller e o core da aplicação onde estão as regras de negócio. É também o arquivo onde novas features podem ser incuídas.

O arquivo payment.py é onde a coisa acontece. Ele possui as classes Payment e Rules.
O arquivo test_payment.py contém os testes unitários para as classes Payment e Rules.

Na classe Payment eu mantive o código original que realiza o pagamento com pequenos ajustes. No final se tudo ocorrer com sucesso é instanciado a classe Rules que contém as regras de envio.

Na classe Rules então está a lógica de acordo com as regras definidas.

O produto foi divido em 3 categorias (digital, físico e assinatura), enquanto o tipo pode ser livro ou não.

Eu classifiquei assim pois o livro pode ser tanto digital quanto físico, pois a contituição embora seja anterior ao cenário digital, ela não restringe o desconto apenas produto físico.

Dito isso, os cenários acomodados na aplicação foram:

| Categoria / tipo | Notificar | Etiqueta | Desconto | Ativar |
|------------------|:---------:|:--------:|:--------:|:------:|
| Digital / Comum  |           |          | X        |        |
| Digital / Livro  |     X     |          | X        |        |
| Físico / Comum   |           | X        |          |        |
| Físico / Livro   | X         | X        |          |        |
| Assinatura       |           |          |          | X      |


No primeiro momento há um agrupamento dos itens nas 3 categoria. E para os itens do tipo livro também são agrupados, mesmo que eles já estejam em outro grupo por causa de suas categorias.
Esse agrupamento permite aplicação de regras flexíveis caso sejam criados outras categorias, tipos e regras, além de que a alteração se daria em um só lugar do código fonte, a classe Rules.

Após o agrupamento respeitando a categoria e o tipo, essas listas são enviadas a classe service que simula o papel de serviços externos como envio de e-mails e impressor de etiquetas de remessa.


##### Repository
Este módulo foi criado apenas para manter dados em memória que facilitam as simulações, substituindo a necessidade de informar tudo através de parâmetros externos, basta um código id do cliente e produto. Num cenário real ele acessaria um banco de dados.


##### Entity
Aqui as classe equivalem a entidades de uma base de dados, como customer, product, order, memberships, etc. Essas classe não possui regras de negócio, apenas estruturas utilizadas na aplicação.
