class Requests

  def initialize
    @base_uri = 'http://jsonplaceholder.typicode.com'
  end

  # Post
  def post(endpoint)
    request = @base_uri + endpoint

    table = @tableJson
    result = HTTParty.post(
        request,
        headers: {'Content-Type' => 'application/json'},
        body: table.to_json
    )
    return result
  end
  
end
