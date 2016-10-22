require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../models/payee'

class TestPayee < Minitest::Test
  
  def setup 
    #name is unique so have to generate randomly
    @rand_name = "tesco_#{rand(9999999).to_s}"
    @payee = Payee.new('name' => @rand_name, 'website' => "www.tesco.com")
  end

  def test_name
    assert_equal(@rand_name, @payee.name)
  end

  def test_website
    assert_equal('www.tesco.com', @payee.website)
  end

  def test_save
    @payee.save
    assert_equal(Fixnum, @payee.id.class)
  end

  def test_all_array
    @payee.save
    assert_equal(Array, Payee.all.class)
  end

  def test_all_payee
    @payee.save
    assert_equal(Payee, Payee.all[0].class)
  end   

  def test_find_payee
    @payee.save
    @id = Payee.all.first.id
    assert_equal(Payee, Payee.find(@id).class)
  end


end