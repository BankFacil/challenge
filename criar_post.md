# Explicação do teste de criar post


Estou passando parametros para minha variavel `@body`

```
  @body = {
    title: 'O titulo do batita',
    body: 'comentario do batista',
    userId: 1
  }
```

Aqui estou fazendo a requisição post passando a url e o body
```
  @post = HTTParty.post('https://jsonplaceholder.typicode.com/posts', body: @body)
```

Nesta parte estou validando a resposta da api e validando os dados que foram cadastrados
```
  expect(@post.code).to eq 201
  expect(@post.parsed_response['title']).to eq 'O titulo do batita'
  expect(@post.parsed_response['body']).to eq 'comentario do batista'
  expect(@post.parsed_response['userId']).to eq '1'
```
