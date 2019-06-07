
Dado("dados que crie um POST para API pública JsonPlaceHolder") do
  @result = Jsonplaceholder.new($gerador_title, $gerador_body, $gerador_userid).create_list_post
end
  
Então("o status code é {string}") do |status_code|
  expect(@result.code).to match status_code
end

Então("é criado o POST com sucesso") do
  Validate.new.matchers_expect(@result)
end
