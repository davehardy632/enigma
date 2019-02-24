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

  def test_total_rotation
    @enigma.random_numbers
    assert_equal Hash, @enigma.total_rotation.class
  end

  def test_encrypt_letter
    assert_equal "k", @enigma.encrypt_letter("h", 3)
  end

  def test_encrypt_message
    @enigma.random_numbers
    @enigma.total_rotation
    assert_equal "keder ohulw", @enigma.encrypt_message("hello world")
  end

  def test_encrypt
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

end
