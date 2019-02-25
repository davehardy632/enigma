require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

class RandomNumberGeneratorTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_random_number_generator
    assert_equal 5, @enigma.random_number_generator.length
  end

  def test_key_helper # manual
    expected = {"A"=>"02",
                "B"=>"27",
                "C"=>"71",
                "D"=>"15"}

    assert_equal expected, @enigma.key_helper("02715")
  end

  def test_keys
    expected = {"A"=>2,
                "B"=>27,
                "C"=>71,
                "D"=>15}

    assert_equal expected, @enigma.keys("02715")
  end

end
