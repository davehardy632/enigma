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

  def test_random_numbers #default
    assert_equal 5, @enigma.random_numbers.length
  end

  def test_key_helper #default
    @enigma.random_numbers

    assert_equal Hash, @enigma.key_helper.class
  end

  def test_manual_key_helper # manual entry
    assert_equal Hash, @enigma.manual_key_helper("02715").class
  end

  def test_manual_keys #manual entry
    assert_equal Hash, @enigma.manual_keys("02715").class
  end

  def test_manual_offset_helper #manual
    assert_equal Array, @enigma.manual_offset_helper("040895")
  end

  def test_manual_offsets
    assert_equal Hash, @enigma.manual_offsets("040895")
  end

  def test_manual_total_rotation
    assert_equal Hash, @enigma.manual_total_rotation("02715","040895")
  end

  def test_keys #default
    @enigma.random_numbers
    assert_equal Hash, @enigma.keys.class
  end

  def test_random_date # default
    assert_equal 40895, @enigma.random_date
  end

  def test_offset_helper #default
    assert_equal Array, @enigma.offset_helper.class
  end

  def test_offsets #default
    assert_equal Hash, @enigma.offsets.class
  end

  def test_total_rotation #default
    @enigma.random_numbers
    assert_equal Hash, @enigma.total_rotation.class
  end

  def test_encrypt_letter #default
    assert_equal "k", @enigma.encrypt_letter("h", 3)
  end

  def test_encrypt_message #default
    @enigma.random_numbers
    @enigma.total_rotation
    assert_equal "keder ohulw", @enigma.encrypt_message("hello world")
  end

  # def test_encrypt
  #   @enigma.random_numbers
  #   @enigma.total_rotation
  #   expected = {
  #               encryption: "keder ohulw",
  #               key: "02715",
  #               date: "040895"
  #             }
  #   assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  # end

end
