Given("que estou na página {string}") do |string|
  @home = Home.new
  @home.load(destino: string)
end

When("clico no botão {string}") do |string|
  click_on  string
end

Then("o checkbox é removido") do
  page.has_no_field?('checkbox')
end

And("a mensagem {string} aparece") do |string|
  page.has_content?(string)
end

Given("que estou na página {string} sem checkbox") do |string|
  @home = Home.new
  @home.load(destino: string)
  page.execute_script("onClick()")
end

Then("o checkbox é adicionado") do
  page.has_field?('checkbox')
end

