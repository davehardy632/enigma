require './lib/enigma'
require './lib/date_generator'
require './lib/random_number_generator'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

encrypted_text = enigma.encrypt(incoming_text)

puts "Created '#{ARGV[1]}' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"

writer = File.open(ARGV[1], "w")

writer.write(encrypted_text[:encryption])

writer.close
