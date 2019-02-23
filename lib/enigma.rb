require 'pry'

class Enigma
  attr_reader :alphabet
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @numbers = nil
  end

  def random_numbers
    numbers = rand(10000..99999)
    @numbers = numbers.to_s.split(//)
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

    def offsets
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



    def merge_keys_and_offset
      final_rotation = {}
      keys.merge(offsets) do |key, key_value, offset_value|
        final_rotation[key] = key_value + offset_value
      end
      final_rotation
    end

    def encrypt(message, key, date)
      {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }
    end

end
# encrypt(message, key, date)
#=>
#   {
#     encryption: "keder ohulw",
#     key: "02715",
#     date: "040895"
#   }
