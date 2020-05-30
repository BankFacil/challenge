# ---

class DynamicControlsPage < SitePrism::Page
  include RSpec::Matchers

  element :button,            'button[id="btn"]'
  element :checkbox,          'input[id="checkbox"]'
  element :p_message, :xpath, '//*[@id="message"]'

  def access_dynamic_controls_page
    visit(Settings.get_url('dynamic_controls'))
  end

  def click_dynamic_button
    button.click
  end

  def validate_presented_phrase(phrase)
    expect(p_message.text).to eql(phrase)
  end
end
