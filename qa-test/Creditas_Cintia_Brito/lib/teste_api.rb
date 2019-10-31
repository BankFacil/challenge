#Essa segunda opção nao tem step. Um arquivo executavel

require 'rubygems'
require 'httparty'
require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

#Obs: o recurso não será realmente criado no servidor
response = HTTParty.post("https://jsonplaceholder.typicode.com/posts", body: {
    userId: 1,
    title: "foo",
    body: "bar"
})
puts response.code, response.body