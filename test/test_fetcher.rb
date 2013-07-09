require 'bankleitzahl'
require 'minitest/autorun'
require 'minitest/mock'

class TestParser < MiniTest::Unit::TestCase

  def test_failed_fetching
    fetcher_mock = MiniTest::Mock.new
    fetcher_mock.expect(:fetch, nil, [Bankleitzahl::Fetcher::CURRENT_URL])
    assert_equal nil, Bankleitzahl::Fetcher.current_lines(fetcher_mock)
  end

  def test_successful
    fetcher_mock = MiniTest::Mock.new
    fetcher_mock.expect(:fetch, "content", [Bankleitzahl::Fetcher::CURRENT_URL])
    assert_equal "content", Bankleitzahl::Fetcher.current_lines(fetcher_mock)
  end

end
