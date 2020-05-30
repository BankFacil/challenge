# ---

class WindowsPage < SitePrism::Page
  include RSpec::Matchers

  element :new_window_heading, :xpath, '//div/h3'

  def access_windows_page
    visit(Settings.get_url('windows'))
  end

  def click_on_link
    @new_window = window_opened_by { click_link 'Click Here' }
  end

  def open_new_window(new_path)
    within_window(switch_to_window(@new_window)) do
      expect(new_window_heading.text).to eql('New Window')
      expect(URI.parse(current_url).to_s).to include(new_path) 
    end
  end
end
