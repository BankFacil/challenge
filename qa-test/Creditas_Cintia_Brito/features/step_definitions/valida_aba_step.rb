#Acessando o site windows
Dado("estou na pagina windows") do                                           
    @page_aba = Aba.new
    @page_aba.load
    sleep 5
end                                                                          

#Ao clicar no link tem na tela
Quando("clicar no link") do                                                  
    @page_aba.click_here.click
    sleep 5
end                                                                          
                                                                               
#É aberto uma nova aba
Então("posso ver uma nova aba") do                                           
    @page_aba = ValidaAba.new
    @page_aba.load
    sleep 5
end                                                                          

#E é exibido nesse nova aba uma mensagem "New Window"
Então("verificar se a aba foi aberta corretamente") do                       
    expect(@page_aba.msg_aba.text).to have_content "New Window"
end                                                                          