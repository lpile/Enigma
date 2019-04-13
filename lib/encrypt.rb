require_relative 'enigma'

enigma = Enigma.new
message = File.open(ARGV[0], "r")
encryption = enigma.encrypt(message.read.chop)
new_file = File.open(ARGV[1], "w")
new_file.write(encryption[:encryption])

puts "Created #{ARGV[1]} with the key #{enigma.shift.key} and the date #{enigma.shift.date}"
