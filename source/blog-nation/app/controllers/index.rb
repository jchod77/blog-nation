get '/' do
  if !session[:id]
    @id = session[:id]
    @posts = Post.find_all_by_user_id(@id)
  else
    @posts = Post.all
  end

  @tags = Tag.all
  erb :index
end
