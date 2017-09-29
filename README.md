
## Quais são as dependências?

O projeto depende do MiniTest para a sua suíte de testes e utilização de mocks, além do Rake apenas para facilitar a execução de todos os testes.

## Como posso ver o projeto funcionando?

O projeto já possui um `Rakefile.rb` para a tarefa de execução dos testes unitários. Basta executar:

```shell
rake test
```

Caso receba este output, os testes foram executados com sucesso.
```
Finished in 0.007027s, 1992.3154 runs/s, 1850.0071 assertions/s.

14 runs, 13 assertions, 0 failures, 0 errors, 0 skips
```

## Estrutura Principal

* `/test`: pasta onde se encontra todos os testes
* `/lib/domain`: pasta onde se encontra as regras de negócio da aplicação
* `/lib/infra`: pasta onde se encontra as classes de infraestrutura (envio de email / repositório)
* `bootstrap.rb`: as referências dos arquivos ficaram concentradas neste arquivo, somente para fins da proposta

## Solução do Desafio

**Manter código legado funcionando**

Antes de iniciar qualquer tipo de intervenção, foi criado um teste unitário afim de garantir que o código legado (código de exemplo fornecido inicialmente) não acabasse ficando quebrado durante as modificações do código desconhecido. O código original permanece na suíte de testes `BootstrapTest.test_original_bootstrap `.


**Evitar o uso de if/switch nestes cenários**

Os quatro principais requisitos poderiam ter sido solucionados com condicionais, porém iriam ferir o príncipio de Open/Closed do SOLID. Decidiu-se portanto criar classes especializadas da OrderItem para cada um dos comportamentos solicitados, fechando as classes para modificação e abrindo-as para extensão. O polimorfismo utilizado desta forma alivia a classe Order (na qual tem uma lista de OrderItem) da responsabilidade de saber o tipo de cada um dos produtos na lista. Para ela, tudo é um OrderItem e o pagamento apenas notificará cada elemento da lista de maneira uniforme, ficando a cargo das especializações, a execução do comportamento específico dependendo da instância.

**Injeção de dependência para comunicação externa**

Nos pontos onde podem haver interações externas como envio de email ou shipping label (não houve implementação concreta para fins da proposta), injetei as dependências via construtor. Isso favoreceu a criação de um código mais testável, pois estas classes puderam ser mockadas e também permitiram que os testes unitários checassem se os mocks receberam os parâmetros conforme esperado. Além disso, a injeção de dependência colaborou com um desacoplamento entre estas classes.

**Factory para abstrair a criação das classes especializadas**

As classes especializadas dependem do tipo de produto para serem criadas, exigindo uma lógica simples para tal. Porém, isso pode acabar se tornando em um emaranhado de condicionais espalhadas pelo sistema e dificultando cada vez mais a manutenção. Para evitar isso, centralizei a criação das instâncias destas classes dentro de uma Factory. Apenas utilizei um mapping do tipo de produto com a instância a ser construída. Desta maneira, a lógica de criação não precisa ficar exposta para os consumidores e as composições podem conservar somente a lógica necessária para ficarem coesas.