

#index
get '/transactions' do
  @transactions = Transaction.all
  erb(:'/transactions/index')
end

#new
get '/transactions/new' do 
  @payees = Payee.all
  erb(:'/transactions/new')
end

#create
post '/transactions' do
  puts params
  @transaction = Transaction.new( params )
  @transaction.save
  redirect to(:'/transactions')
end

#show
get '/transactions/:id' do
  @transaction = Transaction.find( params[:id] )
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