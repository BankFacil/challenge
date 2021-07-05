Dado(/^que o usuário está na página do Checkbox$/) do
  @cb = CheckboxPage.new
  @cb.open_checkbox_page
end

Quando(/^tocar no botão (Remove|Add)$/) do |condition| 
  @cb.click_on_button
end

Então(/^visualiza a mensagem de (remoção|adicionado) sucesso$/) do |condition|
  if condition == "remoção" 
    expect(@cb.check_feedback_message).to eql(MESSAGES[:REMOVE_MESSAGE])
  else
    expect(@cb.check_feedback_message).to eql(MESSAGES[:ADD_MESSAGE])
  end
end
    
