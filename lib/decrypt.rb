require_relative 'enigma'

enigma = Enigma.new

message = File.open(ARGV[0], "r")
decryption = ""
message.each {|line| decryption += enigma.decrypt(line.chop, ARGV[2], ARGV[3])[:decryption] + "\n"}
message.close

new_file = File.open(ARGV[1], "w")
new_file.write(decryption)
new_file.close

puts "Created '#{ARGV[1]}' with the key #{enigma.shift.key} and the date #{enigma.shift.date}"
