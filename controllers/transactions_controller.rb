

#index
get '/transactions' do
  @transactions = Transaction.all
  erb(:'/transactions/index')
end

#new
get '/transactions/new' do 
  @payees = Payee.all
  @tags = Tag.all
  erb(:'/transactions/new')
end

#create
post '/transactions' do
  @transaction = Transaction.new( params )
  @transaction.save
  @transaction_id = @transaction.id
  Tagging.extract_from_params( params, @transaction_id )
  redirect to(:'/transactions')
end

#show
get '/transactions/:id' do
  @transaction = Transaction.find( params[:id] )
  erb(:'/transactions/show')
end

#edit
get '/transactions/:id/edit' do
  @transaction = Transaction.find( params[:id] )
  @payees = Payee.all
  @tags = Tag.all
  erb(:'/transactions/edit')

end

#update
put '/transactions/:id' do
  "#{params}"
end

#delete
delete '/transactions/:id' do
  "#{params}"
end