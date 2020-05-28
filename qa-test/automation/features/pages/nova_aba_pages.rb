class NovaAbaPage < SitePrism::Page
  set_url 'https://the-internet.herokuapp.com/windows'

  element :click_here_link, :css, '#content .example a'
  element :alert, :css, '#body > div > h3'
end
