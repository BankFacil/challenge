class HomePage_aba < SitePrism::Page

set_url "https://the-internet.herokuapp.com/windows"

element :msg_add, "a[href='/windows/new']"

	def adicionar_aba 
    msg_add.click
end
end

class NewHomePage_aba < SitePrism::Page
	
set_url "https://the-internet.herokuapp.com/windows/new"

element :msg_new, "div[class='example']"

	def nova_aba 
    msg_new.click
end
end