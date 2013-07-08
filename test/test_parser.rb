require 'bankleitzahl'
require 'minitest/autorun'

class TestBank < MiniTest::Unit::TestCase

  def test_all_banks
    assert_equal 2, Bankleitzahl::Parser.new(content_lines).all_banks.size
  end

  def test_corretly_read_bank_entry
    bank = Bankleitzahl::Parser.new(content_lines).all_banks.first
    assert_equal "12345678", bank.blz
    assert_equal "Sample Bank                                              E", bank.name
    assert_equal "BBk Berlin                E", bank.short_name
    assert_equal "10591", bank.zip
    assert_equal "Berlin                            X", bank.city
    assert_equal "MARKDEF1100", bank.bic
  end

  def content_lines
    @content_lines ||= File.read(File.join(File.dirname(__FILE__), 'fixtures', 'blz_06_2013.txt'))
  end
end
