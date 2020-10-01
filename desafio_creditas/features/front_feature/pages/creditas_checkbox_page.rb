class Checkbox < SitePrism::Page

  set_url ENVIRONMENT['creditas_check']

  element :clicar_botao, '#btn'

  def click_botao
    clicar_botao.click
  end

  def add_botao
   click_on('Add')
  end

end
