require_relative '../models/tag'
require_relative '../models/transaction'
require_relative '../models/payee'
require_relative '../models/tagging'
require_relative '../models/budget'
require_relative '../models/helper'

require 'pry-byebug'


Budget.delete_all
Tag.delete_all
Payee.delete_all
Transaction.delete_all

@tag1 = Tag.new('name' => 'food', 'color' => 'lightgreen')
@tag1.save
@tag2 = Tag.new('name' => 'beer', 'color' => 'lightblue')
@tag2.save
@tag3 = Tag.new('name' => 'clothes', 'color' => '#ccccff')
@tag3.save
@tag4 = Tag.new('name' => 'junk food', 'color' => '#ffccd9')
@tag4.save
@tag5 = Tag.new('name' => 'eating out', 'color' => '#fff2cc')
@tag5.save
@tag6 = Tag.new('name' => 'rent', 'color' => '#C89F9C')
@tag6.save

@payee1 = Payee.new('name' => 'Tesco', 'website' => "www.tesco.com")
@payee1.save
@payee2 = Payee.new('name' => 'Sainsburys', 'website' => 'sainsburys.co.uk')
@payee2.save
@payee3 = Payee.new('name' => 'M&S', 'website' => "http://www.marksandspencer.com")
@payee3.save
@payee4 = Payee.new('name' => 'H&M', 'website' => "www.hm.com")
@payee4.save
@payee5 = Payee.new('name' => 'Amazon', 'website' => "www.amazon.co.uk")
@payee5.save

@budget1 = Budget.new('name' => 'essentials', 'amount' => 1000)
@budget1.save
@budget2 = Budget.new('name' => 'fun', 'amount' => 200)
@budget2.save
@budget3 = Budget.new('name' => 'holiday', 'amount' => 500)
@budget3.save
@budget4 = Budget.new('name' => 'work expenses', 'amount' => 1000)
@budget4.save


@transaction1 = Transaction.new('payee_id' => @payee1.id, 'amount' => 100, 'budget_id' => @budget1.id)
@transaction1.save

@transaction2 = Transaction.new('payee_id' => @payee2.id, 'amount' => 20, 'budget_id' => @budget1.id)
@transaction2.save

@transaction3 = Transaction.new('payee_id' => @payee4.id, 'amount' => 50, 'budget_id' => @budget1.id)
@transaction3.save



@tagging = Tagging.new('tag_id' => @tag1.id, 'transaction_id' => @transaction1.id)
@tagging.save



binding.pry
nil


