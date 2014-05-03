get '/posts/:id' do
  @tags = Tag.all
  @posts = Post.find_all_by_user_id(params[:id])
  erb :profile
end
