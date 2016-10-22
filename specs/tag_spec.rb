require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../models/tag'

class TestTag < Minitest::Test
  
  def setup 
    #name is unique so have to generate randomly
    @rand_name = "food_#{rand(9999999).to_s}"
    @tag = Tag.new('name' => @rand_name, 'color' => 'green', 'description' => 'Total food budget', 'budget' => 200)
  end

  def test_name
    assert_equal(@rand_name, @tag.name)
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

  def test_all_array
    @tag.save
    assert_equal(Array, Tag.all.class)
  end

  def test_all_tag
    @tag.save
    assert_equal(Tag, Tag.all[0].class)
  end   

  def test_find_tag
    @tag.save
    @id = Tag.all.first.id
    assert_equal(Tag, Tag.find(@id).class)
  end


end