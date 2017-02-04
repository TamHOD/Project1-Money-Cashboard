require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')



require_relative './db/sql_runner'

require_relative './models/tag'
require_relative './controllers/tags_controller'

require_relative './models/payee'
require_relative './controllers/payees_controller'

require_relative './models/transaction'
require_relative './controllers/transactions_controller'

require_relative './models/tagging'
require_relative './controllers/taggings_controller'

require_relative './models/budget'
require_relative './controllers/budgets_controller'

require_relative './models/helper'

require 'sinatra/flash'
enable :sessions

before do
  @path = request.path_info

end

get '/' do
  puts "TESTING"
  redirect to('/tags')
end