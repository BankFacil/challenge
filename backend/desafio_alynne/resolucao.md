# Desafio Python 




# Introdução

  Pensando em melhorar o entedimento do código e facilitar novas codificações, eu alterei e criei novas classes.
  Em um primeiro momento eu percebi que o atributo order constava em quase todas as classes, achei que isso estava deixando o código um pouco redundante, por isso mudei algumas classes baseado no modelo da figura  -> modelo.png
  
  Eu também  separei as classes em arquivos 
  
  
  Mudei a classe Order para que ela já tenha uma lista de produtos. Eu retirei a classe order_items do escopo, achei que operação de inserção de produtos ficou mais simples, desta forma.
  Retirei também o parâmetro order da classe invoice já que ela está associada a um pagamento e um pagamento já possui o atributo order
  Criei a classe Customer com um parâmetro do tipo MemberShip, pensei em fazer que clientes que possui algum tipo de filiação ganha-se um desconto no final da compra, hoje eu deixei padrão 10% e eu não criei mais um tipo de filiação, mas caso faça sentido para o negocio é só aplicar a logica da class produtos apra que cada tipo de filiação o cliente possua um desconto, ou qualquer outra vantagem.
  
  
  # Envios de produtos
  
  Primeiramente na classe produto criei um atributo chamado procudtType
  Para poder dizer que cada produto eu vou fazer um envio diferente sem fazer varios if concatenados, eu pensei em usar o conceito de decorator
  Então eu criei a função envia que não faz nada, porém na hora de instanciar um produto, no construtor a função envia na vdd vai receber a função baseada no productType do produto
  
     self.envia = getattr(self, productType)(self.envia)
Ou seja quando eu criar um produto que seja do tipo 'book' a função envia na verdade vai ser a função book() que vai por exemplo, executar a chamada que  faz o shipping label 

```
def book(self,func):
    def wrapper():
        print("Enviar para endereço")
        func()
    return wrapper
```

Quando um novo tipo de produto for criado basta ir na classe produto e criar um novo decorator ou uma nova combinação de decoratorpara atender aquele novo tipo

***Tipo de produto***
    Eu criei os seguintes tipos
- physical_item 
        gera um shipping label para o mesmo ser colocado na caixa do envio
- comum_book
        gera o shipping label com uma notificação de que trata-se de um item isento de impostos conforme disposto na Constituição Art. 150, VI, d.
- digital_signature
        ativa a assinatura, e notificar o usuário através de e-mail sobre isto;
- midia_digital
        envia a descrição da compra por e-mail ao comprador, conceder um voucher de desconto de R$ 10 ao comprador associado ao pagamento.
