

#index
get '/tags' do
  @tags = Tag.all
  erb(:'/tags/index')
end

#new
get '/tags/new' do 
  erb(:'/tags/new')
end

#create
post '/tags' do
  @tag = Tag.new( params )
  @tag.save
  redirect to(:'/tags')
end

#show
get '/tags/:id' do
  @tag = Tag.find( params[:id] )
  erb(:'/tags/show')
end

#edit
get '/tags/:id/edit' do
  "#{params}"
end

#update
put '/tags/:id' do
  "#{params}"
end

#delete
delete '/tags/:id' do
  "#{params}"
end



