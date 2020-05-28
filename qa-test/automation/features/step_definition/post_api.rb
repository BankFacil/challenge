Quando("preencher e enviar o body") do
  @body = {
     "title":"Desafio para QA - Test Engineer",
     "body":"Desafio",
     "userId": 601,
   }.to_json

   @post_clientes = HTTParty.post 'http://jsonplaceholder.typicode.com/posts',
     :body => @body,
     :headers => {
         "Content-Type" => 'application/json'
     }
end

Então("o status da requisição deverá retornar {int}") do |int|
  expect(@post_clientes.code).to eq 201
  json = JSON.parse(@post_clientes.body)
  expect(json['title']).to eq('Desafio para QA - Test Engineer')
  expect(json['body']).to eq('Desafio')
  expect(json['userId']).to eq(601)
end
