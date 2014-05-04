enable :sessions

#SECURITY FILTER
#-----------------------------------------------------
before '/users/secure/*' do
  if !session[:id]
    redirect '/'
  end
end

get '/posts/all' do
  @posts = Post.all
  @tags = Tag.all
  erb :all_posts
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @tags = Tag.all
  @comments = @post.comments

  erb :single_post
end

get '/users/secure/posts/create' do
  @tags = Tag.all

  erb :create_post

end

post '/users/secure/posts/create' do
  @post = Post.new(params[:post])
  @post.save
    p "==================================="
  p @post.id
  p "------------------------------------"
  # Need to fix redirect link.  New post is being created and saved but
  # I'm not passing anything into the wildcard in the redirect below
  redirect '/posts/:id'
end

get '/users/secure/posts/all/:id' do
  @tags = Tag.all
  @posts = Post.find_all_by_user_id(params[:id])
  p "++++++++++++++++++++++++++++++++++"
  p @posts
  erb :profile
end

get '/posts/edit/:id' do
  @post = Post.find(params[:id])
  @tags = Tag.all

  erb :edit_post
end
post '/posts/edit/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])

  redirect '/'

end

get '/posts/delete/:id' do
   @post = Post.find(params[:id])
   @tags = Tag.all
   erb :delete_post
end

post '/posts/delete/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end

get '/posts/tag/:id' do
  @tags = Tag.all
  @target_tag = Tag.find_by_id(params[:id])
  @posts = @target_tag.posts
  erb :posts_by_tag
end



