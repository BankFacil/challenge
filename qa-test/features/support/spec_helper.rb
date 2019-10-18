# encoding: utf-8
# !/usr/bin/env ruby

Dir[File.join(File.dirname(__FILE__), '../screens/*.rb')].each { |file| require file }

module Pages
    def desafio_segunda_parte_a
        Pages::HomePageSegundaParteA.new
    end

    def desafio_segunda_parte_b
        Pages::HomePageSegundaParteB.new        
    end
end