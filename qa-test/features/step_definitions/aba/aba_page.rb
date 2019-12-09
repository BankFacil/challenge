class AbaPage < SitePrism::Page

    element :content, '#content'

    def validaTela
        resp = content.visible?
        return resp
    end

    def clicarLink
        find("a[href='/windows/new']").click
    end

    def focusNewTabs
        #Get the main window handle
        main = page.driver.browser.window_handles.first
        #Get the popup window handle
        popup = page.driver.browser.window_handles.last
        #Then switch control between the windows
        page.driver.browser.switch_to.window(popup)
    end


end