enable :sessions

#SECURITY FILTER
#-----------------------------------------------------
before '/users/secure/*' do
  if !session[:id]
    redirect '/'
  end
end

get '/' do
  if session[:id]
    @user = User.find_by_id(session[:id])
    @posts = Post.find_all_by_user_id(session[:id])
  else
    # @posts = Post.all
  end

  @tags = Tag.all
  erb :index
end

get '/users/all' do
@users = User.all
@tags = Tag.all
erb :all_users
end


