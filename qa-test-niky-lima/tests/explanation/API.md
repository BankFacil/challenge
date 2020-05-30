# Um pouco sobre o teste de API

**Vou esmiuçar um pouco sobre o teste de API e sua estrutura dentro do projeto**

Para os testes de API, foi utilizado a biblioteca HTTParty que possui um ótimo recurso para o desenvolvimento de pacote para teste de serviços.

- No projeto, basicamente enviamos alguns parâmetros pela body com o intuito de publicar um comentário, função essa do próprio serviço.

- Segue o trecho do código e uma curta explicação no mesmo:

```
def request
    ## Criação dos dados a serem publicados utilizando faker.
    ## A body deve ser enviada com um hash .json (contendo a chave e o valor a ser persistido). 

    @body = {
      'title':  Faker::FunnyName.name,
      'body':   Faker::Lorem.paragraphs,
      'userId': Faker::Number.digit
    }.to_json

    ## Montamos o teste utilizando o HTTParty (verbo post) e no Settings temos
    ## o método get_uri que nos retorna a uri desejada. Apenas temos a obrigação
    ## de passar o '/caminho' que identifica o serviço requisitado.

    @result = HTTParty.post Settings.get_uri('posts'), :body => @body,
      :headers => {
        'Content-Type' => 'application/json'
      }
  end

  def response
    ## Aqui, validamos o http status code 201 - que quer dizer CRIADO!
    ## Também validamos o 'userId' que enviamos com o que retorna no response...
    ## Assim sabemos de fato se nosso post ocorreu.
    ## O expect usado é o que está disponibilizado no pacote do RSPEC.
    ## Esses validadores do RSPEC são muito simples de usar e possuem
    ## um vasto campo para tratamento. Desse modo, deixamos o tratamento
    ## na classe responsável pelo request/response, o que evita sujar nosso
    ## step_definitions com muitas linhas. O ideal é que ele realmente tenha
    ## poucas linhas de lógica.

    expect(@result.code).to eql(201)
    expect(JSON.parse(@body)['userId']).to eql(@result.parsed_response['userId'])
    # ---
    puts @result.body
  end
```

## [Ir para o README](../README.md)