require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative '../models/tagging'

class TestTagging < Minitest::Test
  
  def setup
    @tagging = Tagging.new( 'tag_id' => 2, 'transaction_id' => 3 )
  end

  def test_can_read_tag_id
    assert_equal( 2, @tagging.tag_id)
  end

  def test_can_read_transaction_id
    assert_equal( 3, @tagging.transaction_id)
  end



end