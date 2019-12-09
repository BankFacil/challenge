Dado("que o usuário informou os seguintes dados:") do |table|
    @api = ApiUtil.new
    @api.data = table.rows_hash
end

Quando("eu faço uma solicitação POST para o serviço order") do
    @result = @api.postPlaceHolder
end

Então("o código de resposta HTTP deve ser igual a {string}") do |status_code|
    expect(@result.response.code).to eql status_code
end

Então("devo visualizar um json conforme o contrato da API do serviço POST") do
    expect(@result['title']).to be_a(Numeric).or be_a(String)
    expect(@result['body']).to be_a(Numeric).or be_a(String)
    expect(@result['userId']).to be_a(Numeric).or be_a(String)
    expect(@result['id']).to be_a Numeric
    expect(@result.length).to eql 4
end

