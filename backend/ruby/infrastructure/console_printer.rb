require 'colorize'

class ConsolePrinter
    def print(message)
        puts "PRINTER: #{message}".green
    end
end