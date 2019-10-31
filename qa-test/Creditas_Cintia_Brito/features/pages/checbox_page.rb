#Criando uma classe para instacinar o elementos 
class Checkbox < SitePrism::Page
    set_url "https://the-internet.herokuapp.com/dynamic_controls"

    element :btn_remove, "button[id='btn']"
    element :btn_add, "button[id='btn']"
    element :msg, "p[id='message']"
end