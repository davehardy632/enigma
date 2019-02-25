require 'pry'
require 'date'
require './lib/date_generator'
require './lib/random_number_generator'
require './lib/enigma_helper_methods'

class Enigma

  include DateGenerator
  include RandomNumberGenerator
  include EnigmaHelperMethods
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key = random_number_generator , date = date_generator)
    {
      encryption: encrypt_message(message, key, date),
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = date_generator)
     {
       decryption: decrypt_message(message, key, date),
       key: key,
       date: date
     }
  end

end
