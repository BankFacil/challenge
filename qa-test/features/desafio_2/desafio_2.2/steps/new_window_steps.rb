Given("that i access the main screen page of the system with the link") do
    visit "https://the-internet.herokuapp.com/windows"
    expect(page).to have_text("Opening a new window")
    sleep(5)
end
  
Given("has a link visible on screen") do
    expect(page).to have_css(desafio_segunda_parte_b.verify_link_action)
end
  
When("i click on the link to open a new window") do
    desafio_segunda_parte_b.link_action
    sleep(5)
end
  
Then("i switch to the new window") do
    new_window = switch_to_window { title == "New Window" }
end
  
Then("i validate the message on the body of page") do
    expect(page).to have_text("New Window")
end
  
Then("i validate the current url") do
    url = URI.parse(current_url).to_s
    expect(url).to include("/windows/new")
end