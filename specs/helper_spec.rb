require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../models/helper'

class Test
  attr_reader :value
  def initialize(value)
    @value = value
  end
end

class TestHelper < Minitest::Test
  
  def setup
    @expected = "http://www.google.com"
  end


  def test_fix_url  
      @input = "www.google.com"
      assert_equal(@expected, Helper.fix_url( @input ))
  end


  def test_fix_url_already_ok
      @input = "http://www.google.com"
      assert_equal(@expected, Helper.fix_url( @input ))
  end

  def test_blank
      @input = ""
      assert_equal(nil, Helper.fix_url( @input ))
  end

  def test_totaller
    @test_array = [Test.new(10), Test.new(15)]
    assert_equal( 25, Helper.totaller(@test_array, "value") )
  end

end
