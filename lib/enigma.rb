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
  end






  # The Keys
  # The keys are created by generating a random five digit number, like 02715, and splitting it up like so:
  #
  # A key: first two digits (02)
  # B key: second and third digits (27)
  # C key: third and fourth digits (71)
  # D key: fourth and fifth digits (15)
