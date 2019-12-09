Dado("que estou na tela principal do Opening a new window {string}") do |title|
    @base = AbaPage.new
    resp = @base.validaTela
    expect(resp).to be true 
    expect(page).to have_title title
end
  
Quando("eu clico no botão Clique Aqui") do
    @base.clicarLink
end

Então("eu devo ver uma nova aba com o título {string} e a mensagem {string}") do |titulo, mensagem|
    @base.focusNewTabs
    expect(page).to have_title titulo
    expect(page).to have_content(mensagem) 
end
  
  
  