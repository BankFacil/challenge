Given("I am on herokuapp windows page") do
  @last_response = FirstTab.new
  @last_response.load
end

Given("I click on a link") do
  @new_tab = window_opened_by { @last_response.link.click }
end

Then("I should be able to see a {string} on a new tab") do |message|
  within_window @new_tab do
    page.should have_content(message)
  end
end
