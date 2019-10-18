Given("that i have the URI of jsonplaceholder API to consume a resource") do
    @restInstance = "http://jsonplaceholder.typicode.com/"
end

When("i define the params of structure") do
    @headers = {
        #define headers params
    }

    @queryString = {
        #define queryStrings params
    }
    
    @path = {
        resource: "posts"
    }

    @body = {
        data: {
            title: "Creditas API's",
            body: "Body to Creditas API's",
            userId: 1
        }
    }
end

Then("i receive a valid response body with attributes sended on API structure") do
    expect(@body[:data][:title]).to eq(@response["data[title]"])
    expect(@body[:data][:body]).to eq(@response["data[body]"])
    expect((@body[:data][:userId]).to_s).to eq(@response["data[userId]"])
    puts (JSON.pretty_generate JSON.parse(@response.body))
end

Then("a valid status code equal to {int}") do |response_code|
    expect(@response.code).to eq(response_code)
    puts "Status Code da chamada: #{@response.code}"
end