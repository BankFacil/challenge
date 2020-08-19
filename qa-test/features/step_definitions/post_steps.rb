Dado('que uma mensagem é enviada via POST para a API JsonPlaceHolder') do
    @data = {
        "title": "Expecto",
        "body": "Accio",
        "userId": 66
    }
    
    @response = HTTParty.post 'http://jsonplaceholder.typicode.com/posts',
        :body => @data
end
    
Entao('devemos receber o código de sucesso') do
    puts "Mensagem recebida no servidor\n#{@response.body}"
    puts "Código recebido\n#{@response.code}"
    codigo = expect(@response.code).to eq 201
    puts "Código enviado igual ao recebido: #{codigo}"
end