class NovaAba < SitePrism::Page

  set_url ENVIRONMENT['creditas_nova_aba']

  element :click_here, '#content > div > a'

  def nova_aba
    click_here.click
  end
end
