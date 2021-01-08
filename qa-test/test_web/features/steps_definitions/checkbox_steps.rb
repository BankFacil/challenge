Dado('que eu acessei o site do the-internet') do
  checkbox_page.load
end

Quando('eu removo o checkbox') do
  checkbox_page.remover_checkbox
end

Então('eu verifico se o checkbox foi removido') do
  expect(page.has_no_css?('#checkbox')).to eq true
end

Então('verifico a mensagem {string}') do |message|
  checkbox_page.wait_for_message
  expect(checkbox_page.message.text).to eq message
end

Dado('que eu removi o checkbox') do
  checkbox_page.remover_checkbox
  expect(page.has_no_css?('#checkbox')).to eq true
end

Quando('eu adicionar o checkbox') do
  checkbox_page.adicionar_checkbox
end

Então('eu verifico se o checkbox foi adicionado') do
  expect(page.has_css?('#checkbox')).to eq true
end
