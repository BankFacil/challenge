Dado("que estou na tela principal do Dynamic Controls") do
    @base = CheckBoxPage.new
    resp = @base.validaTela
    expect(resp).to be true 
end

Dado("que eu removi o checkbox") do
    steps(%"
        E eu clico no botão Remover
        E não devo ver o checkbox
    ")
end
  

Quando("eu clico no botão Remover") do
    @base.clicarBtn
end

Então("não devo ver o checkbox") do
    expect(page).to have_no_selector(:xpath, "//*[@id='checkbox']")
end

Quando("eu clico no botão Adicionar") do
    @base.clicarBtn
end

Então("devo ver o checkbox") do
    resp = @base.validaCheckBox
    expect(resp).to be true
end

Então("eu devo ver a mensagem {string}") do |mensagem|
   resp = @base.validaMensagem
   expect(resp).to eql(mensagem)
end