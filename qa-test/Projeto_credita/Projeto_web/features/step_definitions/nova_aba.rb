Quando(/^clico no Link Click Here$/) do
    @nova_aba = FuncionalidadeNovaPagina.new
    click_link "Click Here"
end

Entao(/^a nova aba é abresentada com o texto "([^"]*)"$/) do |texto_nova_aba|
    @nova_aba.wait_window_handles(2) 
    page.driver.browser.switch_to.window(page.driver.browser.window_handles[1])
    expect(@nova_aba.txt_nova_aba.text).to eql texto_nova_aba
end
  
