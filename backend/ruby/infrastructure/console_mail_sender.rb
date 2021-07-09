require 'colorize'

class ConsoleMailSender
    def send(mail, message)
        puts "Mail sent to #{mail}: #{message}".yellow
    end
end