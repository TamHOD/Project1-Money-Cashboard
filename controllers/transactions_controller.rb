

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
  puts params
  @transaction = Transaction.new( params )
  @transaction_id = @transaction.save.id
  
  @tags_ids = []
  params.each_pair do |key, value|
    if value == "on" and key[0..6] == "tag_id_"
      @tag_id = key.split("tag_id_")[1].to_i
      @tagging = Tagging.new('tag_id' => @tag_id, 'transaction_id' => @transaction_id)
      @tagging.save
    end
 
  end 
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