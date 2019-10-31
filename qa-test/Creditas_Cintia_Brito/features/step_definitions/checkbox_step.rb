#Acessando o site dynamic controls
Dado("estou na pagina dynamic controls") do
    @page_check = Checkbox.new
    @page_check.load
    sleep 5
end
  
#No site a um botão "Remove". Ao clicar no botão, é apresentado uma execução
Quando("clico no botão Remove") do
    @page_check.btn_remove.click
    sleep 5
end

#Quando termina a execução, é exibido o botão "Add". Ao clicar nesse botão o processo entra em execução  
Quando("clico no botão Add") do
    @page_check.btn_add.click
    sleep 5
end

#Finalizada a execução, retorna na tela o "A Checkbox"  
Então("aparece o checkbox na tela") do
    expect(@page_check.msg.text).to have_content "It's back!"
end

#Finalizada a execução, é removido da tela "A Checkbox"
Entao("o checkbox é removido da tela") do                                    
    expect(@page_check.msg.text).to have_content "It's gone!"
end                                                                          