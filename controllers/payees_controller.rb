

#index
get '/payees' do
  @payees = Payee.all
  erb(:'/payees/index')
end

#new
get '/payees/new' do 
  erb(:'/payees/new')
end

#create
post '/payees' do
  @payee = Payee.new( params )
  @payee.save
  redirect to(:'/payees')
end

#show
get '/payees/:id' do
  @payee = Payee.find( params[:id] )
  erb(:'/payees/show')
end

#edit
get '/payees/:id/edit' do
  "#{params}"
end

#update
put '/payees/:id' do
  "#{params}"
end

#delete
delete '/payees/:id' do
  "#{params}"
end