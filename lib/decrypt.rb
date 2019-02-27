require './lib/enigma'
require './lib/date_generator'
require './lib/random_number_generator'

enigma = Enigma.new

def date_generator
  date = Date.today
  string = date.strftime("%m%d%y")
end

def random_number_generator
  random_num = rand(100..99999)
  string = random_num.to_s.rjust(5, "0")
  string
end

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

encrypted_text = enigma.decrypt(incoming_text, ARGV[2].to_s, ARGV[3].to_s)

puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"

writer = File.open(ARGV[1], "w")

writer.write(encrypted_text[:decryption])

writer.close
