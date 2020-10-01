Dado("que eu acesso o link do desafio") do
  @app = Checkbox.new
  @app.load
end

Quando("eu clicar em remover") do
  @app.click_botao
end

Então("eu verei a mensagem {string}") do |msg|
  expect(page).to have_content msg
end

Quando("eu clicar em adicionar") do
  @app.click_botao
  @app.add_botao
end

Então("eu devo visializar o botão {string}") do |msg|
  expect(page).to have_content msg
end
