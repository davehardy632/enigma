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

  def test_key_helper # manual entry
    assert_equal Hash, @enigma.key_helper("02715").class
  end

  def test_keys #manual entry
    assert_equal Hash, @enigma.keys("02715").class
  end

end
