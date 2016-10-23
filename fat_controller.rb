require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')

require_relative './models/tag'
require_relative './controllers/tags_controller'

require_relative './models/payee'
require_relative './controllers/payees_controller'

require_relative './models/transaction'
require_relative './controllers/transactions_controller'

require_relative './models/tagging'
require_relative './controllers/taggings_controller'