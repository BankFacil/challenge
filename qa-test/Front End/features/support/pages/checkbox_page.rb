class CheckboxPage < SitePrism::Page
  set_url '/dynamic_controls'
  
  element :chbox, 'input[id="checkbox"]'
  element :texto, 'p[id="message"]'

  def press_remove
    click_on('Remove')
  end

  def press_add
    click_on('Add')
  end

  def checkbox_exists?
    page.has_field?('checkbox')
  end

  def add_button_exists?
    page.find('#checkbox-example [type="button"]').text == "Add"
  end

end
