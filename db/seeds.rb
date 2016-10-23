require '../models/tag'
require '../models/transaction'
require '../models/payee'



Tag.delete_all

@tag1 = Tag.new('name' => 'food', 'color' => 'lightblue', 'description' => 'Total food budget', 'budget' => 200)
@tag1.save

Payee.delete_all
Transaction.delete_all


