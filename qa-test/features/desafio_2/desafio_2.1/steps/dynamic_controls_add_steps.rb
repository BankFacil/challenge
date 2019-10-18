When("i click on Add button") do
    desafio_segunda_parte_a.button_action
    sleep(10)
end

Then("another message is showed") do
    expect(page).to have_text("It's back!")
end

Then("a checkbox it is added to the screen") do
    expect(page).to have_css(desafio_segunda_parte_a.verify_check_box)
end
  
Then("i can check it to TRUE") do
    desafio_segunda_parte_a.check_the_box
    expect(page.find(desafio_segunda_parte_a.verify_check_box)).to be_checked
    sleep(5)
end

Then("i can check it to FALSE") do
    desafio_segunda_parte_a.check_the_box
    expect(page.find(desafio_segunda_parte_a.verify_check_box)).not_to be_checked
    sleep(5)
end