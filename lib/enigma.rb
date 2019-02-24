require 'pry'
require 'date'

class Enigma
  attr_reader :alphabet
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @numbers = nil
    # @input_numbers = nil
  end

  def random_numbers
    numbers = rand(10000..99999)
    @numbers = numbers.to_s.split(//)
    new_numbers = rand(10000..99999)
    new_numbers = new_numbers.to_s.split(//)
  end

  def key_helper
    letter_keys = Hash.new(0)
    @numbers
    letter_keys["A"] = @numbers[0..1]
    letter_keys["B"] = @numbers[1..2]
    letter_keys["C"] = @numbers[2..3]
    letter_keys["D"] = @numbers[3..4]
    letter_keys
    end

    def keys
      keys = {}
      key_helper.each do |key, value|
        keys[key] = value.join.to_i
      end
      keys
    end

    def date
      40895
    end

    def offset_helper
    organize = []
    offset_key = date * date
    organize << offset_key.to_s.split(//)
    organize.flatten
    end

    def offsets # final offset values in a hash
      offset_keys = {}
      offset_to_int = {}
      offset_keys["A"] =   offset_helper[-4]
      offset_keys["B"] =   offset_helper[-3]
      offset_keys["C"] =   offset_helper[-2]
      offset_keys["D"] =   offset_helper[-1]
      offset_keys.each do |key, value|
        offset_to_int[key] = value.to_i
      end
      offset_to_int
    end



    def total_rotation
      final_rotation = {}
      keys.merge(offsets) do |key, key_value, offset_value|
        final_rotation[key] = key_value + offset_value
      end
      final_rotation
    end

    def encrypt_letter(letter, number) # not needed in final method
      new_letter = letter.tr(@alphabet.join, @alphabet.rotate(number).join)
      new_letter
    end

    def encrypt_message(string)
      message = string.downcase.split(//)
      new = []
      message.each_with_index do |letter, index|
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

    # def encrypt(message, key = , date)
    #   encryption_info = {}
    #   encryption_info[encryption:] =  encrypt_message(message)
    #   encryption_info[key:] = key
    #   encryption_info[date:] = date
    # end
end
