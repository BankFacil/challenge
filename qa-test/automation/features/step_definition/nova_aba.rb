Dado("que eu acesse a url da nova aba") do
  @nova_aba_page = NovaAbaPage.new
  @nova_aba_page.load
end

Quando("eu clicar no link Click Here") do
  @new_window = window_opened_by do
    @nova_aba_page.click_here_link.click
  end
end

Então("deverá abrir uma nova aba corretamente") do
  expect(page.driver.browser.window_handles.size).to eq(2)
  expect(@new_window).not_to be_nil
end

Então("deverá exibir New Window") do
  within_window @new_window do
    expect(page).to have_content('New Window')
  end
  @new_window.close
end
