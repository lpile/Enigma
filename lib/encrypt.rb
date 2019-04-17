require_relative 'enigma'

enigma = Enigma.new

message = File.open(ARGV[0], "r")

encryption = ""
message.each {|line| encryption += enigma.encrypt(line.chop)[:encryption] + "\n"}
message.close

new_file = File.open(ARGV[1], "w")
new_file.write(encryption)
new_file.close

puts "Created '#{ARGV[1]}' with the key #{enigma.shift.key} and the date #{enigma.shift.date}"
