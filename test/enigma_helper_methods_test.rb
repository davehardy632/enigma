require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

class EnigmaHelperMethodsTest < Minitest::Test
  def setup
    @enigma = Enigma.new
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
    assert_equal "e", @enigma.decrypt_letter("h", 3)
  end

  def test_manally_decrypt_message
    assert_equal "hello world", @enigma.manually_decrypt_message("keder ohulw", "02715", "040895")
  end

end
