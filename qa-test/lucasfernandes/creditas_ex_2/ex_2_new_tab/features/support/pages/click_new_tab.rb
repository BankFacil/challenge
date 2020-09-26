class FirstTab < SitePrism::Page
  set_url 'https://the-internet.herokuapp.com/windows'
  element :link, '#content > div > a'
end
