require_relative 'enigma.rb'

enigma = Enigma.new
message = File.open(ARGV[0], "r")
decryption = enigma.decrypt(message.read, ARGV[2], ARGV[3])
new_file = File.open(ARGV[1], "w")
new_file.write(decryption[:decryption])

puts "Created '#{ARGV[1]}' with the key #{enigma.key} and the date #{enigma.date}"
