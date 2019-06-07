class SetUrl < SitePrism::Page
    set_url $base_url['base_url'] 
  end

class FuncionalidadeCheckbox < SitePrism::Page

    element :btn_remover, '#btn'
    element :btn_add, '#btn'
    elements :input_txt_checkbox, :xpath, '//*[@id="checkbox"]'
    element :input_checkbox, '#checkbox'

    def validar_butao(txt_nome)
      if self.btn_add.text != txt_nome
        self.btn_add.click
        sleep 3
        self.wait_element_visible('#btn')
      else
        "Botão #{txt_nome}"
      end
    end

    def wait_element_visible(element)
        find(element, :visible => true, wait: 5)
    end

    def validar_remocao_checkbox(elemento)
        page.has_css?(elemento, wait: 1) == false ? true : false 
    end

end