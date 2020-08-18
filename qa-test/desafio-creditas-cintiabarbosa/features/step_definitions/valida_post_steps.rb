Quando("cadastrar um novo post com dados validos") do
  @body = {
    "userId": 10,
    "title": "teste automacao servico",
    "body": "validando post",
  }.to_json
  @post_test = HTTParty.post 'http://jsonplaceholder.typicode.com/posts',
    :body => @body,
    :headers => {
        "Content-Type" => 'application/json'
    }
end

Então("o post foi criado com sucesso") do
   puts @post_test.body
  expect(@post_test.code).to eq 201
end

