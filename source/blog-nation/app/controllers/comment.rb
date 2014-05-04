get '/comment/new' do
@tags = Tag.all

erb :new_comment
end
