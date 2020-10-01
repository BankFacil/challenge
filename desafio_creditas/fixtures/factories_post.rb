class PostFactory

  def self.factory_post
      body = YAML.load_file('./fixtures/templates_post.yml').dup

      body['title'] = Faker::Movie.quote
      body['body'] = Faker::Lorem.sentence
      body['userId'] = Faker::Number.number(2).to_i

      body
  end
end
