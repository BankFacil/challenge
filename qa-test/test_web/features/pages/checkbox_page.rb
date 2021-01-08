class CheckboxPage < SitePrism::Page
  set_url '/dynamic_controls'
  element :button_remove_add, 'button[onclick="swapCheckbox()"]'
  element :message, '#message'

  def remover_checkbox
    button_remove_add.click
  end

  def adicionar_checkbox
    button_remove_add.click
  end
end
