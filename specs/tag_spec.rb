require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../models/tag'

class TestTag < Minitest::Test
  
  def setup 
    @tag = Tag.new('name' => 'food', 'color' => 'green', 'description' => 'Total food budget', 'budget' => 200)
  end

  def test_name
    assert_equal('food', @tag.name)
  end

  def test_color
    assert_equal('green', @tag.color)
  end

  def test_description
    assert_equal('Total food budget', @tag.description)
  end

  def test_budget
    assert_equal(200, @tag.budget)
  end

  def test_budget_float
    assert_equal(Float, @tag.budget.class)
  end

  def test_save
    @tag.save
    assert_equal(Fixnum, @tag.id.class)
  end


end