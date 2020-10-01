class CreditaPost

  include HTTParty

  base_uri ENVIRONMENT["creditas_post"]
  format :json
  headers 'Content-Type' => 'application/json'

#==================================================================================================
  # CREDITAS API
#==================================================================================================

  def post(hashbody)
    self.class.post("/posts", :body => hashbody.to_json)
  end

end
