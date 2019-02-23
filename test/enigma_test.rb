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

  def test_date
    assert_equal 40895, @enigma.date
  end

  def test_offset_helper
    assert_equal Array, @enigma.offset_helper.class
  end

  def test_offsets
    assert_equal Hash, @enigma.offsets.class
  end

  def test_merge_keys_and_offset
    @enigma.random_numbers
    assert_equal Hash, @enigma.merge_keys_and_offset.class
  end

end
