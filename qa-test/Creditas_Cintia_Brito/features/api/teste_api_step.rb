#Foi feito duas funcionalidade de teste de API. Esse essa primeira opção foi criado cenarios para enviar um POST.
#Obs: o recurso não será realmente criado no servidor

Dado("que eu envie os parâmetros para o endpoint POST") do                   
    @body = {"userId": 1, 
             "title": 'Teste de automacao API', 
             "body": 'Validaçao do POST' 
            }.to_json
    @post = HTTParty.post 'https://jsonplaceholder.typicode.com/posts',
        :body => @body,
        :headers => {
        "Content-Type" => 'application/json'
                    }
end                                                                          
                                                                               
Entao("devo ver o response code e response body na tela") do                                      
    puts "Status Code #{@post.code}", @post.body #@post.headers.inspect
    expect(@post.code).to eq 201
end                                                                          