require 'site_prism'

module Pages
    class HomePageSegundaParteB < SitePrism::Page        
        def elements_page
            {
                link_window: "a[href='/windows/new']"
            }
        end

        def link_action
            find(elements_page[:link_window]).click
        end

        def verify_link_action
            elements_page[:link_window]
        end
    end
end