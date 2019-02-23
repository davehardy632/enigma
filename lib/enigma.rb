require 'pry'

class Enigma
  attr_reader :alphabet
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def random_numbers
    numbers = rand(99999)
    numbers.to_s.split(//)
  end

  # def keys
  #   letter_keys = Hash.new {|hash, key| hash[key] = []}
  #   letter_keys["A"] = random_numbers[0]
  #   end
end


  # The Keys
  # The keys are created by generating a random five digit number, like 02715, and splitting it up like so:
  #
  # A key: first two digits (02)
  # B key: second and third digits (27)
  # C key: third and fourth digits (71)
  # D key: fourth and fifth digits (15)
