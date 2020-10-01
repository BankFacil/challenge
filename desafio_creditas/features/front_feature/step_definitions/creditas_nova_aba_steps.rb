Dado("que eu acesse the internet herokuapp windows") do
  @nova_aba = NovaAba.new
  @nova_aba.load
end

Quando("eu clicar na opção Click Here") do
  @nova_aba.nova_aba
end

Então("eu validarei que estou na nova aba com a mensagem {string}") do |msg|
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  expect(page).to have_content msg
end
