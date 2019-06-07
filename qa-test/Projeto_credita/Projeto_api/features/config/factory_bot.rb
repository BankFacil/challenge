class Full
  FactoryBot.define do
    name = Faker::StarWars.character
  
    factory :board_options, :class => :Full do |u|
        u.title Faker::Lorem.word
        u.body Faker::Lorem.paragraph
        u.userId Faker::Number.between(1, 100)
    end

    factory :mensagem_exception, aliases: [:erro_msg], :class => :Full do |u|
        u.post_nao_existente { raise ArgumentError.new("Não são apresentadas as informações: 
            #{$gerador_title.to_s}
            #{$gerador_body.to_s}
            #{$gerador_userId.to_s}") }    
    end
  end
end