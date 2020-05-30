require 'faker'
require 'httparty'

class PostsApi
  include RSpec::Matchers

  def request
    @body = {
      'title':  Faker::FunnyName.name,
      'body':   Faker::Lorem.paragraphs,
      'userId': Faker::Number.digit
    }.to_json

    @result = HTTParty.post Settings.get_uri('posts'), :body => @body,
      :headers => {
        'Content-Type' => 'application/json'
      }
  end

  def response
    expect(@result.code).to eql(201)
    expect(JSON.parse(@body)['userId']).to eql(@result.parsed_response['userId'])
    # ---
    puts @result.body
  end
end
