class Dynamic_controls
    include Capybara::DSL  


    def selecionarCheckbox
     find("#checkbox > input[type=checkbox]")
    end 

    def selecionarRemover
      find ("#checkbox-example > button")
    end 
end