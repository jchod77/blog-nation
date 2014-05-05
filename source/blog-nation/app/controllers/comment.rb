get '/posts/:id/comments/new' do
@tags = Tag.all
@post = Post.find_by_id(params[:id])

erb :new_comment
end


post '/posts/:id/comments/new' do
# Why is the params[comment] call not working here?- from the new_comment erb form
@comments = Comment.new(content: params[:content], user_id: params[:user_id], post_id: params[:post_id])
@comments.save

  # Need to fix redirect link.  New post is being created and saved but
  # I'm not passing anything into the wildcard in the redirect below
  redirect to "/posts/#{@comments.post_id}"
end
