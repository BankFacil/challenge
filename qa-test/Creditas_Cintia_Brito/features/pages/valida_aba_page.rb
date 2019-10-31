#Criando uma classe para instacinar o elementos 
class Aba < SitePrism::Page
    set_url "https://the-internet.herokuapp.com/windows"

    element :click_here, "a[href='/windows/new']"
end

class ValidaAba < SitePrism::Page
    set_url "https://the-internet.herokuapp.com/windows/new"

    element :msg_aba, "div[class='example']"
end