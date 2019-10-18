When("make a send with verb post") do
    arr = []
    @path.each do |key, values|
        arr.push(values)
    end

    path_edited = arr.join('/')
    uri_structured = ("#{@restInstance}#{path_edited}")

    @response = HTTParty.post(uri_structured, headers: @headers, query: @query, body: @body)
end
#--------------------------------------------------------------------------------------------
When("make a send with verb put") do
    arr = []
    @path.each do |key, values|
        arr.push(values)
    end

    path_edited = arr.join('/')
    uri_structured = ("#{@restInstance}#{path_edited}")

    @response = HTTParty.put(uri_structured, headers: @headers, query: @query, body: @body)
end
#--------------------------------------------------------------------------------------------
When("make a send with verb get") do
    arr = []
    @path.each do |key, values|
        arr.push(values)
    end

    path_edited = arr.join('/')
    uri_structured = ("#{@restInstance}#{path_edited}")

    @response = HTTParty.get(uri_structured, headers: @headers, query: @query)
end
#--------------------------------------------------------------------------------------------
When("make a send with verb delete") do
    arr = []
    @path.each do |key, values|
        arr.push(values)
    end

    path_edited = arr.join('/')
    uri_structured = ("#{@restInstance}#{path_edited}")

    @response = HTTParty.delete(uri_structured, headers: @headers, query: @query)
end
#--------------------------------------------------------------------------------------------