# Desafio para QA - Explicação

### 1. Especificação

Foram feitos 4 cenários (esquemas de cenário) para a funcionalidade do login.

A princípio seriam necessários somente 2 cenários: um com dados válidos e outro com o login ou a senha inválida. Neste segundo a mensagem seria "login ou senha inválidos" como é comum hoje em dia.
Neste caso resolvi usar a validação do login para o usuário saber se seu cadastro é existente.

A última funcionalidade poderia ser suprimida e ficar junto com o usuário não cadastrado, mas acho que essa validação extra pode ajudar o usuário e evitar um contato desnecessário para a solução do problema.

### 2 - Automação de testes funcionais

#### 2.1 Adionar e remover o checkbox

Inverti a ordem para a remoção primeiro pois a página mostra o checkbox por padrão.

Utilizei um _page object_ somente para a url, pois ela é a mesma nos dois casos (adição e remoção), sendo diferente somente o complemento, que é passado por parâmetro em cada cenário.

Poderia ter feito um _page object_ para o botão, pois é o mesmo id, mas isso implicaria em mais um _snippet_ para implementação. Resolvi passar por parâmetro pelo nome do botão, pois assim o nome também é validado.

A validação da adição/remoção é feita em duas etapas para cada: se o checkbox está ou não presente na tela e as mensagens de sucesso. A combinação checkbox/mensagem deve ser correta.

No caso da adição do ckeckbox, resolvi chamar a remoção diretamente por Javascript para garantir que o checkbox não estaria presente, caso alguma mudança de label ou id do botão.

#### 2.2 Nova aba

Não implementei um _page object_ por ser um cenário muito simples. Prefiro sempre validar pelo nome/título da página/aba, salvo exceções. No caso o nome da aba para a troca e depois o conteúdo.

Em links também prefiro pelo nome do link, pois é mais uma validação.


#### 2.3 Criar post via API

Sem muitos segredos. Somente implementei mensagens de resposta para visualização do que foi enviado/recebido.
