class Newaba
    include Capybara::DSL

    def selecioneCliqueHere
    find("#content > div > a")
    end

end 