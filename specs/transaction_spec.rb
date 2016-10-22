require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../models/transaction'

class TestTransaction < Minitest::Test
  
  def setup 
   
    @transaction = Transaction.new('payee_id' => 10, 'amount' => 50)
  end

  def test_payee_id
    assert_equal(10, @transaction.payee_id)
  end

  def test_amount
    assert_equal(50.00, @transaction.amount)
  end

  def test_save
    @transaction.save
    assert_equal(Fixnum, @transaction.id.class)
  end

  def test_all_array
    @transaction.save
    assert_equal(Array, Transaction.all.class)
  end

  def test_all_transaction
    @transaction.save
    assert_equal(Transaction, Transaction.all[0].class)
  end   

  def test_find_transaction
    @transaction.save
    @id = Transaction.all.first.id
    assert_equal(Transaction, Transaction.find(@id).class)
  end


end