Dado("que o usuário informou os seguintes dados") do |table|
  @dados = table.rows_hash
end

Quando("eu faço uma solicitação POST para API") do
  @resultado = HTTParty.post(
    'http://jsonplaceholder.typicode.com/posts',
    body: @dados.to_json,
    headers: {"Content-type": "application/json; charset=UTF-8"}
    )
end

Então("o código de resposta HTTP deve ser igual a {string}") do |status_code|
  expect(@resultado.response.code).to eql status_code
end

Então("os dados devem ser cadastrados com sucesso") do
  expect(@resultado["title"]).to eq @dados["title"]
  expect(@resultado["body"]).to eq @dados["body"]
  expect(@resultado["userId"]).to eq @dados["userId"]
  expect(@resultado["id"]).to eq @dados["id"]

end

