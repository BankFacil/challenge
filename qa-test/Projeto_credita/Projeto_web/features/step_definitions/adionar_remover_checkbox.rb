Dado(/^que acesse a homepage$/) do
    SetUrl.new.load
    @checkbox = FuncionalidadeCheckbox.new
end

Quando(/^clico no botão Add$/) do
    @checkbox.validar_butao("Add")
    sleep 2
    @checkbox.btn_add.click
end

Entao(/^o "([^"]*)" é adicionado com sucesso$/) do |txt_checkbox|
    @checkbox.wait_element_visible("#message")
    expect(@checkbox.input_txt_checkbox[0].text).to eql txt_checkbox
end

Quando(/^clico no botão Remover$/) do
    @checkbox.input_txt_checkbox[1].set(true)
    @checkbox.validar_butao("Remover")
    @checkbox.btn_remover.click
end
  
Entao(/^o "([^"]*)" é removida com sucesso$/) do |txt_checkbox|
    expect(@checkbox.validar_remocao_checkbox("#message")).to eql true
    @checkbox.wait_element_visible("#btn")
    expect(@checkbox.btn_add.text).to eql "Add"
end
  