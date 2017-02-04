

#index
get '/payees' do
  @error = flash[:error]
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
  @payee = Payee.find( params[:id ])
  erb(:'/payees/edit')
end

#update
put '/payees/:id' do
  Payee.update( params )
  redirect to(:'/payees')
end

#delete
delete '/payees/:id' do
  if Payee.find( params[:id ]).transactions.size == 0
    Payee.delete( params[:id] )
  else 
    flash[:error] = "Can't delete Payee - they still have transactions. Please delete / reassign transactions"
  end
  redirect to(:'payees')
end