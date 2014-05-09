enable :sessions

#SECURITY FILTER
#-----------------------------------------------------
before '/users/secure/*' do
  if !session[:id]
    redirect '/'
  end
end

#LOG OUT#
#-----------------------------------------------------
  get '/users/secure/logout' do
    session[:id] = nil
    redirect '/'
  end


#LOGIN
#----------------------------------------------------
get '/users/login' do
  @tags = Tag.all
      erb :'/user/login'
end


post '/users/login' do
  user = User.find_by_username(params[:username])
  unless !user
    if user.authenticate(params[:password])
      session[:id] = user.id
      redirect '/'
    else
      redirect '/'
    end
  else
    redirect '/'
  end
end



#NEW ACCOUNT CREATION#
#------------------------------------------------------
get '/users/create_account' do
  @tags = Tag.all
  erb :'user/create_account', layout: !request.xhr?
end

post '/users/create_account' do
  user = User.new(name: params[:name],
                  username: params[:username],
                  email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password])
  user.save

  redirect '/'
end

#USERS PAGES
#------------------------------------------------------------
get '/users/all' do
@users = User.all
@tags = Tag.all
erb :'/user/all_users'
end

get '/users/:id/posts' do
  @user = User.find_by_id(params[:id])
  @posts = @user.posts
  @tags = Tag.all

  erb :'/user/user_posts'
end













