Quando('envio um post e um comentario') do
  @body = {
    title: 'O titulo do batita',
    body: 'comentario do batista',
    userId: 1
  }
  @post = HTTParty.post('https://jsonplaceholder.typicode.com/posts', body: @body)
end

Entao('verifico se o post foi cadastrado') do
  expect(@post.code).to eq 201
  expect(@post.parsed_response['title']).to eq 'O titulo do batita'
  expect(@post.parsed_response['body']).to eq 'comentario do batista'
  expect(@post.parsed_response['userId']).to eq '1'
end
