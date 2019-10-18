When("i click on Remove button") do
    desafio_segunda_parte_a.button_action
    sleep(10)
end
  
Then("the checkbox is removed") do
    expect(page).not_to have_css(desafio_segunda_parte_a.verify_check_box)
end
  
Then("a message is showed on the place of the checkbox") do
    expect(page).to have_text("It's gone!")
end