Quando('eu abro a nova aba') do
  nova_aba.load
  nova_aba.abrir_nova_aba
  switch_to_window windows.last
end

Então('eu verifico se a nova aba foi aberta') do
  expect(page).to have_current_path(CONFIG['new_url'], url: true)
  expect(nova_aba.texto_nova_aba.text).to eq 'New Window'
end