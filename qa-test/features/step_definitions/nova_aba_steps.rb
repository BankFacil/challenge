Given("que estou na página Opening a new window") do
    visit "https://the-internet.herokuapp.com/windows"
end
  
When("clico em {string}") do |string|
    click_on string
end

Then("o link abre em uma nova aba") do
    within_window(->{ page.title == 'New Window' }){
        page.has_content?('New Window')
    }
end
  
  