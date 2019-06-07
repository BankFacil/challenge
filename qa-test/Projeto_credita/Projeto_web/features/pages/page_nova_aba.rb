class FuncionalidadeNovaPagina < SitePrism::Page

    element :txt_nova_aba, '.example'

    def wait_window_handles(time) 
        5.times do |i| 
            if page.driver.browser.window_handles.size > 1 
                sleep 2
                break 
            end 
            sleep time 
        end 
    end
end