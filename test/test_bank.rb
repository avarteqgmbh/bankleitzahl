require 'bankleitzahl'
require 'minitest/autorun'

class TestBank < MiniTest::Unit::TestCase
  def test_presence
    assert_equal "BLZ", Bankleitzahl::Bank.new("BLZ").blz
  end
end
