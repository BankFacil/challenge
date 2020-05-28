Dado("que eu acesse a url de checkbox") do
  @checkbox_page = CheckboxPage.new
  @checkbox_page.load
end

Quando("eu clicar no botão Remove") do
  @checkbox_page.remove_button.click
  @checkbox_page.wait_until_its_gone_message_visible 5
end

Quando("eu clicar no botão Add") do
  @checkbox_page.add_button.click
  @checkbox_page.wait_until_its_back_message_visible 5
end

Então("o checkbox não deverá mais ser exibido") do
  expect(@checkbox_page).not_to have_checkbox
end

Então("deverá exibir a mensagem {string}") do |alert|
  expect(page).to have_content(alert)
end

Quando("eu selecionar o checkbox") do
  @checkbox_page.checkbox.click
end

Quando("eu des-selecionar o checkbox") do
  @checkbox_page.checkbox.click
end

Então("o checkbox deverá exibir marcado") do
  expect(@checkbox_page.checkbox.checked?).to be_truthy
end

Então("o checkbox deverá exibir desmarcado") do
  expect(@checkbox_page.checkbox.checked?).to be_falsey
end
