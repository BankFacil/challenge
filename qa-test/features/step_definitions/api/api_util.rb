class ApiUtil < Requests

    attr_accessor :data

    def postPlaceHolder
        @tableJson = data
        result = post("/posts")
        return result
    end

end