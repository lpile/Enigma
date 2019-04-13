require './lib/shift'
require './lib/encryption'
require './lib/decryption'

class Enigma
  attr_reader :shift

  def initialize
    @shift = Shift.new
  end

  def encrypt(input_message, input_key = @shift.key, input_date = @shift.date)
    @shift.key = input_key
    @shift.date = input_date
    Encryption.new(input_message, @shift).summary
  end

  def decrypt(input_message, input_key = @shift.key, input_date = @shift.date)
    @shift.key = input_key
    @shift.date = input_date
    Decryption.new(input_message, @shift).summary
  end
end
