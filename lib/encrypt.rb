require './lib/enigma'
require './lib/date_generator'
require './lib/random_number_generator'

enigma = Enigma.new

# def date_generator
#   date = Date.today
#   string = date.strftime("%m%d%y")
# end
#
# def random_number_generator
#   random_num = rand(100..99999)
#   string = random_num.to_s.rjust(5, "0")
#   string
# end

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

encrypted_text = enigma.encrypt(incoming_text, key )

puts "Created '#{ARGV[1]}' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"

writer = File.open(ARGV[1], "w")

writer.write(encrypted_text[:encryption])

writer.close
