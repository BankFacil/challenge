Dado("que eu acesso a url Dynamic Controls") do
  @checkbox.load
  expect(page).to have_content 'Dynamic Controls'
end

Quando("clico no botão de desabilitar o Checkbox") do
  @checkbox.press_remove
end

Então("devo ver a mensagem {string}") do |message|
  expect(page).to have_content message
end

Então("o checkbox deve ficar invisível na página") do
  expect(@checkbox.checkbox_exists?).to be_falsey
end

Dado("o checkbox está desabilitado") do
  @checkbox.press_remove
  @checkbox.wait_until_texto_visible
  expect(@checkbox.add_button_exists?).to be_truthy
end

Quando("clico no botão de habilitar o Checkbox") do
  @checkbox.press_add
end

Então("o checkbox deve ficar visível na página") do
  expect(@checkbox.checkbox_exists?).to be_truthy
end
