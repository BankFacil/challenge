class NovaAbaPage < SitePrism::Page
  set_url '/windows'
  element :button, 'a[href="/windows/new"]'
  element :texto_nova_aba, 'h3'

  def abrir_nova_aba
    button.click
  end
end
