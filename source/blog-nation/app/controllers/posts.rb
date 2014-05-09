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
  erb :'/post/all_posts'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @tags = Tag.all
  @comments = @post.comments
  @post_tags = @post.tags

  erb :'/post/single_post'
end

get '/users/secure/posts/create' do
  @tags = Tag.all

  erb :'/post/create_post'

end

post '/users/secure/posts/create' do
  @post = Post.new(params[:post])
  @post.save
  p "++++++++++++++++++++++++++++++++++"
  p params[:tag].class
  p "++++++++++++++++++++++++++++++++++"

  @tag_arr = params[:name].values
  @tags = @tag_arr.downcase.split(",")
  @tags.each do |tag|
    each_tag = Tag.find_or_create_by_tag_name(tag)
    PostTag.create(post_id: @post.id, tag_id: each_tag.id)
    end
  p "++++++++++++++++++++++++++++++++++"
  p @tag
  p "++++++++++++++++++++++++++++++++++"
  redirect "/posts/#{@post.id}"
end

get '/users/secure/posts/all/:id' do
  @tags = Tag.all
  @posts = Post.find_all_by_user_id(params[:id])
  p "++++++++++++++++++++++++++++++++++"
  p @posts
  erb :'/user/profile'
end

get '/posts/edit/:id' do
  @post = Post.find(params[:id])
  @tags = Tag.all

  erb :'/post/edit_post'
end
post '/posts/edit/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])

  redirect '/'

end

get '/posts/delete/:id' do
   @post = Post.find(params[:id])
   @tags = Tag.all
   erb :'/post/delete_post'
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
  erb :'/post/posts_by_tag'
end



