class CheckBoxPage < SitePrism::Page

    element :btn, '#btn'
    element :message, '#message'
    element :content, '#content'

    def clicarBtn
        btn.click
    end

    def validaCheckBox
        resp = first('#checkbox').visible?
        return resp
    end

    def validaMensagem
        resp = message.text
        return resp
    end

    def validaTela
        resp = content.visible?
        return resp
    end



end