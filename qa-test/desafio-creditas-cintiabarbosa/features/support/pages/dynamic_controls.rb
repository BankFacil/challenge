
class HomePage < SitePrism::Page
#acessa a página para remover ou adicionar o checkbox	
set_url "https://the-internet.herokuapp.com/dynamic_controls"
#os elementos da página utilizados no teste
element :remove_button, "button[id='btn']"
element :add_button, "button[id='btn']"
element :msg_success, "p[id='message']"
#clica no botão "remove"
	def remover_botao 
    remove_button.click
end
#clica no botão "add"
	def adicionar_botao
	add_button.click
end

end
