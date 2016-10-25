require_relative '../models/tag'
require_relative '../models/transaction'
require_relative '../models/payee'
require_relative '../models/tagging'
require_relative '../models/budget'
require_relative '../models/helper'

require 'pry-byebug'



Tag.delete_all
Payee.delete_all
Transaction.delete_all

@tag = Tag.new('name' => 'food', 'color' => 'lightblue', 'description' => 'Total food budget', 'budget' => 200)
@tag.save

@payee = Payee.new('name' => 'Tesco', 'website' => "www.tesco.com")
@payee.save

@budget = Budget.new('name' => 'essentials', 'amount' => 1000)
@budget.save

@transaction = Transaction.new('payee_id' => @payee.id, 'amount' => 100, 'budget_id' => @budget.id)
@transaction.save

@tagging = Tagging.new('tag_id' => @tag.id, 'transaction_id' => @transaction.id)
@tagging.save



binding.pry
nil


