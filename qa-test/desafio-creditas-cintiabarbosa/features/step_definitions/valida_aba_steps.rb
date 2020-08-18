#acessa o site para validar nova aba
Dado("que acessei o site com o link para nova janela") do
  @home_aba=HomePage_aba.new
  @home_aba.load
end

Quando("clicar no link") do
  @home_aba.wait_for_msg_add
  @home_aba.adicionar_aba
end

Então("abre uma nova janela") do
  @newhome_aba=NewHomePage_aba.new
  @newhome_aba.load
end

Então("devo verificar se a aba esta correta") do
  @newhome_aba.wait_for_msg_new
  @newhome_aba.nova_aba
end