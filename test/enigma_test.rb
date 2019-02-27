require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/random_number_generator'

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

  def test_encrypt # good
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

  def test_encrypt_with_date_as_default # look this over
    # expected = {
    #      encryption: "sfhazasdbm ",
    #      key: "02715",
    #      date: "022619"
    #    }

    assert_equal Hash, @enigma.encrypt("hello world", "02715").class
    assert_equal 3, @enigma.encrypt("hello world", "02715").length
    assert @enigma.encrypt("hello world", "02715").key?(:encryption)
    assert @enigma.encrypt("hello world", "02715").key?(:key)
    assert @enigma.encrypt("hello world", "02715").key?(:date)
  end

  def test_decrypt_with_date_as_default
    #change test to measure todays date
    @encrypted = @enigma.encrypt("hello world", "02715")
    expected = {
          decryption: "hello world",
          key: "02715",
          date: "022619"
        }
    assert_equal expected, @enigma.decrypt(@encrypted[:encryption], "02715")
  end

  def test_encrypt_with_default_date_and_key
    expected = {
         encryption: "kjharesduq ",
         key: "02715",
         date: "022419"
       }
      assert_equal Hash, @enigma.encrypt("hello world").class
  end

end
