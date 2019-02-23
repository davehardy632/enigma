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

    def offset_organizer
      offset_keys = {}
      offset_keys["A"] =   offset_helper[-4]
      offset_keys["B"] =   offset_helper[-3]
      offset_keys["C"] =   offset_helper[-2]
      offset_keys["D"] =   offset_helper[-1]
      offset_keys
      binding.pry
    end
    # The Offsets
# The offsets are found using the date of transmission.
#
# Consider the date formatted as a number, DDMMYY. If the date is August 4, 1995, it would be represented as 040895.
# Square the numeric form (1672401025)
# Take the last four digits (1025)
# A offset: The first digit (1)
# B offset: The second digit (0)
# C offset: The third digit (2)
# D offset: The fourth digit (5)
  end






  # The Keys
  # The keys are created by generating a random five digit number, like 02715, and splitting it up like so:
  #
  # A key: first two digits (02)
  # B key: second and third digits (27)
  # C key: third and fourth digits (71)
  # D key: fourth and fifth digits (15)
