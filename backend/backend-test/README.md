# Explicação da solução
Para solucionar o problema dos tratamentos de cada tipo de pedido, utilizei o design pattern Strategy aliado com o Enum já presente no codigo, desta forma e possivel obrigar quem está desenvolvendo a nova versão do sistema de colocar um tratamento/fluxo para o novo produto. 

O padrão Strategy é muito util quando estamos trabalhando com regras de negocio, pois as mesmas podem ser alteradas com facilidade, seguindo este modelo você evita if/else, switch/case, ou seja, evitar criar um codigo "macarronico".

Refatorei o codigo dividindo o em arquivos referente a sua responsabilidade e também procurei separar as camadas internas do sistemas das camadas externas, sempre levando em consideração a dependencia através de interfaces.