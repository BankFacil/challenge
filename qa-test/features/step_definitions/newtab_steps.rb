Dado(/^que o usuário está na tela principal$/) do
  @nt = NewTabPage.new
  @nt.open_page
end

Quando(/^tocar no botão Click Here$/) do
  @nt.click_on_link
end

Então(/^visualiza a tela com mensagem da nova aba$/) do
  expect(@nt.new_tab_message).to eql(MESSAGES[:NEW_TAB_MESSAGE])
end

