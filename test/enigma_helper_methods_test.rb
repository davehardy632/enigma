require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

class EnigmaHelperMethodsTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_total_rotation
    expected = {"A"=>3, "B"=>27, "C"=>73, "D"=>20}

    assert_equal expected, @enigma.total_rotation("02715","040895")
  end

  def test_encrypt_message #manual
    assert_equal "keder ohulw", @enigma.encrypt_message("hello world", "02715", "040895")
  end

  def test_decrypt_letter
    assert_equal "e", @enigma.decrypt_letter("h", 3)
  end

  def test_decrypt_message
    assert_equal "hello world", @enigma.decrypt_message("keder ohulw", "02715", "040895")
  end

end
