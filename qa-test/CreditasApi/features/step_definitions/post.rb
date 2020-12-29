Given("que desejo validar o campo body da API JsonPlaceHolder") do
    page = Apipost.new
    @result = page.api_post
     puts @result
    
  end
  
  Then("retorna codigo {int}") do |int|
    expect(@result.code).to eq   201
    puts "Código de retorno é #{@result.code}"
    expect(@result["body"]).to eq "teste creditas"
    
  end