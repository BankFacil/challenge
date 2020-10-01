Dado("que eu faço um post na api do desafio") do
  @response_body = PostFactory.factory_post
  @response = CreditaPost.new.post(@response_body)
end

Quando("a api responde o status code {string} criado") do |code|
  expect(@response.code).to eq code.to_i
end

Então("eu valido as informações que meu post foi criado") do
  expect(@response['title']).to eq @response_body['title']
  expect(@response['body']).to eq @response_body['body']
  expect(@response['userId']).to eq @response_body['userId']
end
