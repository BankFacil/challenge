 page = Dynamic_controls.new

Given("que  estou na home page do site Dynamic Controls") do
    page.has_text?("Dynamic Controls")
    expect(page.has_text?("Dynamic Controls")).to eq true
  end
  
  When("seleciono a opção incluir checkbox") do
   page.selecionarCheckbox.click
  
  end
  
  Then("checkbox e adicionado com sucesso") do
    page.selecionarCheckbox.checked?

  end
  
  When("seleciono a opção remover checkbox") do
    page.selecionarCheckbox.click
    page.selecionarRemover.click
  end
  
  Then("checkbox e removido com sucesso") do  
    page.selecionarCheckbox.checked? == false
  end