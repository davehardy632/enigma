require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_attributes
    expected = ("a".."z").to_a << " "
    assert_equal expected, @enigma.alphabet
  end

  def test_random_numbers
    assert_equal 5, @enigma.random_numbers.length
  end

  def test_key_helper
    @enigma.random_numbers

    assert_equal Hash, @enigma.key_helper.class
  end

  def test_keys
    @enigma.random_numbers
    assert_equal Hash, @enigma.keys.class
  end

end
