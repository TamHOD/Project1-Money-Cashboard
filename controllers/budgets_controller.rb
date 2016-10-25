

#index
get '/budgets' do
  @budgets = Budget.all
  erb(:'/budgets/index')
end

#new
get '/budgets/new' do 
  erb(:'/budgets/new')
end

#create
post '/budgets' do
  @budget = Budget.new( params )
  @budget.save
  redirect to(:'/budgets')
end

#show
get '/budgets/:id' do
  @budget = Budget.find( params[:id] )
  erb(:'/budgets/show') 
end

#edit
get '/budgets/:id/edit' do
  @budget = Budget.find( params[:id] )
  erb(:'/budgets/edit')

end

#update
put '/budgets/:id' do
  Budget.update( params )
  redirect to( "/budgets/#{params[:id]}" )
end

#delete
delete '/budgets/:id' do
  Budget.delete( params[:id ])
  redirect to( "/budgets" )

end



