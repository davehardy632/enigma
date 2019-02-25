require 'pry'
require 'date'
require './lib/date_generator'
require './lib/random_number_generator'
class Enigma
  include DateGenerator
  include RandomNumberGenerator
  attr_reader :alphabet
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def manual_key_helper(string) #manual entry
    letter_keys = Hash.new(0)
    string
    letter_keys["A"] = string[0..1]
    letter_keys["B"] = string[1..2]
    letter_keys["C"] = string[2..3]
    letter_keys["D"] = string[3..4]
    letter_keys
  end

  def manual_keys(string) #manual entry
    keys = {}
    key_strings = manual_key_helper(string)
    key_strings.each do |key, value|
      keys[key] = value.to_i
    end
    keys
  end

  def manual_offset_helper(date) #manual
    organize = []
    offset_key = date.to_i * date.to_i
    organize << offset_key.to_s.split(//)
    organize.flatten
  end

  def manual_offsets(date) # final offset values in a hash
      values = manual_offset_helper(date)
      offset_keys = {}
      offset_to_int = {}
      offset_keys["A"] = values[-4]
      offset_keys["B"] = values[-3]
      offset_keys["C"] = values[-2]
      offset_keys["D"] = values[-1]
      offset_keys.each do |key, value|
        offset_to_int[key] = value.to_i
    end
      offset_to_int #potential naming issue
  end

  def manual_total_rotation(key, date) #default used in final encrypt method
    final_rotation = {}
    keys = manual_keys(key)
    offsets = manual_offsets(date)
    keys.merge(offsets) do |key, key_value, offset_value|
      final_rotation[key] = key_value + offset_value
    end
    final_rotation
  end

  def encrypt_letter(letter, number) # not needed in final method #default
    new_letter = letter.tr(@alphabet.join, @alphabet.rotate(number).join)
    new_letter
  end

  def decrypt_letter(letter, number) # not needed in final method #default
  letter = letter.tr(@alphabet.rotate(number).join ,@alphabet.join)
  end

  def manually_encrypt_message(message, key, date)
    split_message = message.downcase.split(//)
    new = []
    total_rotation = manual_total_rotation(key, date)
    split_message.each_with_index do |letter, index|
        if index == 0 || index % 4 == 0
      new << encrypt_letter(letter, total_rotation["A"])
    elsif index == 1 || index % 4 == 1
      new << encrypt_letter(letter, total_rotation["B"])
    elsif index == 2 || index % 4 == 2
      new << encrypt_letter(letter, total_rotation["C"])
    elsif index == 3 || index % 4 == 3
      new << encrypt_letter(letter, total_rotation["D"])
      end
    end
    new.join
  end

  def manually_decrypt_message(message, key, date)
    split_message = message.downcase.split(//)
    new = []
    total_rotation = manual_total_rotation(key, date)
    split_message.each_with_index do |letter, index|
        if index == 0 || index % 4 == 0
      new << decrypt_letter(letter, total_rotation["A"])
    elsif index == 1 || index % 4 == 1
      new << decrypt_letter(letter, total_rotation["B"])
    elsif index == 2 || index % 4 == 2
      new << decrypt_letter(letter, total_rotation["C"])
    elsif index == 3 || index % 4 == 3
      new << decrypt_letter(letter, total_rotation["D"])
      end
    end
    new.join
  end

  def encrypt(message, key = random_number_generator , date = date_generator)
    {
      encryption: manually_encrypt_message(message, key, date),
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = date_generator)
     {
       decryption: manually_decrypt_message(message, key, date),
       key: key,
       date: date
     }
  end

end
