require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

class DateGeneratorTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_date_generator_returns_todays_date
    assert_equal "022419", @enigma.date_generator
  end

end
