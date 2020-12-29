
     class Apipost
     
          def api_post
            HTTParty.post(
                       "http://jsonplaceholder.typicode.com/posts",
                    body:{title: "creditas",body: "teste creditas", userId:"2"}.to_json,
             headers:{
            "Content-Type" => "application/jason",
             },
             )
             
            end
          end