#acesso ao site
Dado("que acessei o site que adiciona o  checkbox") do
  @home=HomePage.new
  @home.load
end
#apresenta o botão "remove", aguarda o botão aparecer e clica
Quando("clicar no botão remove") do
@home.wait_for_remove_button
@home.remover_botao
end
#aguarda o botão "add" e clica
Quando("clicar no botão add") do
@home.wait_for_add_button
@home.adicionar_botao
end
#valida se a mensagem apresentada está correta e o checkbox estará inserido
Então("apresenta checkbox corretamente") do
@home.wait_for_msg_success
page.has_content? ("It's back!")
end