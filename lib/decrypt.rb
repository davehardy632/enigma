require './lib/enigma'
require './lib/date_generator'
require './lib/random_number_generator'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

encrypted_text = enigma.decrypt(incoming_text, ARGV[2].to_s, ARGV[3].to_s)

puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"

writer = File.open(ARGV[1], "w")

writer.write(encrypted_text[:decryption])

writer.close
