require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_date_generator_returns_todays_date
    assert_equal "022419", @enigma.date_generator
  end

  def test_random_number_generator
    assert_equal 5, @enigma.random_number_generator.length
  end

  def test_random
    assert_equal 12, @enigma.random
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
    expected = ["1", "6", "7", "2", "4", "0", "1", "0", "2", "5"]

    assert_equal expected, @enigma.manual_offset_helper("040895")
  end

  def test_manual_offsets
    expected = {"A"=>1, "B"=>0, "C"=>2, "D"=>5}

    assert_equal expected, @enigma.manual_offsets("040895")
  end

  def test_manual_total_rotation
    expected = {"A"=>3, "B"=>27, "C"=>73, "D"=>20}

    assert_equal expected, @enigma.manual_total_rotation("02715","040895")
  end

  def test_manually_encrypt_message #manual
    assert_equal "keder ohulw", @enigma.manually_encrypt_message("hello world", "02715", "040895")
  end

  def test_decrypt_letter
    assert_equal "k", @enigma.decrypt_letter("h", 3)
  end

  def test_manally_decrypt_message
    assert_equal "hello world", @enigma.manually_decrypt_message("keder ohulw", "02715", "040895")
  end

  def test_encrypt
    expected = {
         encryption: "keder ohulw",
         key: "02715",
         date: "040895"
       }
       assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_decrypt
    expected =  {
          decryption: "hello world",
          key: "02715",
          date: "040895"
        }
        assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
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

end
