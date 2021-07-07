Dado("que eu acesso a url Windows") do
  @aba.load
  expect(page).to have_content 'Opening a new window'
end

Quando("clico no link para abrir uma nova aba") do
  @aba.open_window
end


Então("vejo a mensagem {string} na nova aba") do |message|
  @aba.switch_window
  @aba.wait_until_text_visible
  expect(current_url).to eq 'https://the-internet.herokuapp.com/windows/new'
  expect(page).to have_content message
end

