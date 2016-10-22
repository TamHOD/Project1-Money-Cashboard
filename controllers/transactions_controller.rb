

#index
get '/transactions' do
  @transactions = Payee.all
  erb(:'/transactions/index')
end

#new
get '/transactions/new' do 
  erb(:'/transactions/new')
end

#create
post '/transactions' do
  @transaction = Payee.new( params )
  @transaction.save
  redirect to(:'/transactions')
end

#show
get '/transactions/:id' do
  @transaction = Payee.find( params[:id] )
  erb(:'/transactions/show')
end

#edit
get '/transactions/:id/edit' do
  "#{params}"
end

#update
put '/transactions/:id' do
  "#{params}"
end

#delete
delete '/transactions/:id' do
  "#{params}"
end