# Solução do problema

Além de implementar o que foi pedido (opção 'Imóvel' e seus parâmetros), o controle dos valores de garantia e de empréstimo foi feito para que sempre satisfaçam a condição de que o valor máximo do empréstimo deve ser 80% do valor da garantia.

Assim, se o valor da garantia diminuir muito, o valor máximo do range também pode diminuir (se 80% da garantia for menor que o valor máximo da modalidade escolhida), permitindo um melhor controle do valor definido pelo usuário.

Além disso, os inputs de texto também tem esse limitador de valores. Se um valor no input de texto for menor que o valor mínimo, ele é automaticamente atualizado para o valor mínimo daquele range. Se for maior que o máximo, também é atualizado para o valor máximo daquele range.

Na mudança de modalidade, todos os elementos são atualizados de acordo com os novos parâmetros. O range de empréstimo tem o valor mínimo e máximo daquela modalidade. O de garantia vai de 1.25 * (valor minimo do empréstimo),pois é o mínimo que a pessoa deverá ter de garantia para fazer qualquer empréstimo daquela modalidade, até 9.000.000 (valor arbitrário).

# Organização dos Arquivos

## HTML

Os atributos 'value' do seletor de garantia foram mudados para inglês só por questões de padrão de código em inglês.

## CSS

Foi refatorado para 5 arquivos: colors, card, form, header e styles (esse último importa os outros).

## JS

Os arquivos foram dividos em:

### utils.js

Contém operações simples (comparações e formatações em geral).

### eventsHelper.js

Contém operações atreladas aos eventos e a operações utilizando determinados elementos da página.

### index.js

Possui os eventos e suas chamadas.

### testConstants.js

Possui os HTML's usados nos testes.
