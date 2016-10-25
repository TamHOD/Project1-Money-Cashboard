

#index
get '/transactions' do
  @transactions = Transaction.all
  erb(:'/transactions/index')
end

#new
get '/transactions/new' do 
  @payees = Payee.all
  @tags = Tag.all
  @budgets = Budget.all
  erb(:'/transactions/new')
end

#create
post '/transactions' do
  @transaction = Transaction.new( params )
  @saved_transaction = @transaction.save

  Tagging.extract_from_params( params, @saved_transaction.id )
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
  @budgets = Budget.all
  erb(:'/transactions/edit')

end

#update
put '/transactions/:id' do
  Transaction.update( params )
  Tagging.extract_from_params( params, params[:id].to_i )
  redirect to("/transactions/#{params[:id]}")
end

#delete
delete '/transactions/:id' do
  Transaction.delete( params[:id] )
  redirect to("/transactions")
end