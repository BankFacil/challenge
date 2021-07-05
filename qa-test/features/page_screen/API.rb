require "httparty"

class TestAPI
  include HTTParty
  base_uri 'http://jsonplaceholder.typicode.com'
end

RSpec.describe 'Desafio - POST ' do

    it 'Criando um post'  do
    params = {
      "title" => "Deyvirson",
      "body" => "Desafio Creditas",
      "userId" => 1 
    }

    header = {
      "Content-Type" => "application/json; charset=UTF-8"
    }

    begin
      response = TestAPI.post('/posts', :body => params, :header => header );
        expect(response.code).to eql(201)
        expect(response.message).to eql("Created")
    end
  end
end
