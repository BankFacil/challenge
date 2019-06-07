
  include RSpec::Matchers
  require 'rspec'

class Jsonplaceholder
  include HTTParty

  def initialize(title, body, userid)
    @autorization = { "data": {"title": "#{title}","body": "#{body}","userId": userid}}
  end

  def create_list_post
    self.class.post($base_url['base_url'], :body => @autorization)
  end
end

class Validate
  def matchers_expect(result)
    if result.to_s.include?($gerador_title.to_s) == true
      aggregate_failures do
        expect(result.body.to_s).to include $gerador_title.to_s
        expect(result.body.to_s).to include $gerador_body.to_s
        expect(result.body.to_s).to include $gerador_userId.to_s
      end
    else
      FactoryBot.attributes_for(:mensagem_exception)[:erro_msg] 
    end
  end
end