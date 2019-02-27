require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

class DateGeneratorTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_date_generator_returns_todays_date
    assert_equal 6, @enigma.date_generator.length
    assert_equal String, @enigma.date_generator.class
  end

  def test_offset_helper
    expected = ["1", "6", "7", "2", "4", "0", "1", "0", "2", "5"]

    assert_equal expected, @enigma.offset_helper("040895")
  end

  def test_offsets_to_string
    expected = {"A"=>"1", "B"=>"0", "C"=>"2", "D"=>"5"}

    assert_equal expected, @enigma.offsets_to_string("040895")
  end

  def test_offsets
    expected = {"A"=>1, "B"=>0, "C"=>2, "D"=>5}

    assert_equal expected, @enigma.offsets("040895")
  end


end
