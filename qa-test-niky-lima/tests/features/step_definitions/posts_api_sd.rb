# ---

Dado('que eu acesso a api de comentários') do
  @posts_api = PostsApi.new
end

Quando('eu envio o meu comentário') do
  @posts_api.request
end

Então('o comentário deverá ser postado') do
  @posts_api.response
end
