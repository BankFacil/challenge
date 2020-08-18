#acessa o site 
Dado("que acessei o site que remove o  checkbox") do
  @home=HomePage.new
  @home.load 
end
#aguarda o botão "remove" ser aprfesentado e clica
Quando("clicar no botão remover") do
  @home.wait_for_remove_button
  @home.remover_botao
end
#aguarda mensagem de sucesso ser apresentada e valida se está correta
Então("apresenta mensagem de sucesso") do
  @home.wait_for_msg_success
  expect(@home.msg_success.text).to eq "It's gone!"
end