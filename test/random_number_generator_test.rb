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
end
