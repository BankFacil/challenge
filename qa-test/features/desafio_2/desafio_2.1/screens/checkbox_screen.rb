require 'site_prism'

module Pages
    class HomePageSegundaParteA < SitePrism::Page        
        def elements_page
            {
                btn_action: "button[id='btn']",
                check_box: "input[id='checkbox']"
            }
        end

        def button_action
            find(elements_page[:btn_action]).click
        end

        def verify_check_box
            elements_page[:check_box]
        end

        def check_the_box
            find(elements_page[:check_box]).click
        end
    end
end