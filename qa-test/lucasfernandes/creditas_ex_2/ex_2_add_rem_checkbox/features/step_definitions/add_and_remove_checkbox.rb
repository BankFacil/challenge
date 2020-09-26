Given("I am on herokuapp dynamic controls page") do
  @last_response = Checkbox.new
  @last_response.load
end

Given("I select the checkbox and remove it") do
  @last_response.button.click
  sleep 3
end

Given("I click on Add button") do
  steps %Q{
  Given I am on herokuapp dynamic controls page
  Given I select the checkbox and remove it
}
  @last_response.button.click
  sleep 3
end

Then("I should be able to see a {string}") do |message|
  expect(@last_response.message).to have_content(message)
end

Then("I see a checkbox on the screen") do
  @last_response.checkbox.click
end
