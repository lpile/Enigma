# require 'date'
require './lib/shift'

class Enigma
  attr_reader :shift

  def initialize
    @shift = Shift.new
  end

  def encrypt(input_message, input_key = @shift.key, input_date = @shift.date)
    @shift.key = input_key; @shift.date = input_date
    encrypt_message = {}
    message = set_encrypt_message(input_message, input_key, input_date)
    encrypt_message = {encryption: message, key: @shift.key, date: @shift.date}
  end

  def decrypt(input_message, input_key = @shift.key, input_date = @shift.date)
    @shift.key = input_key; @shift.date = input_date
    decrypt_message = {}
    message = set_decrypt_message(input_message, input_key, input_date)
    decrypt_message = {decryption: message, key: @shift.key, date: @shift.date}
  end

  def set_encrypt_message(message, key, date)
    (0...message.length).step(4){|i| message[i] = @shift.set_a_shift(key, date)[@shift.alphabet.find_index(message[i])]}
    (1...message.length).step(4){|i| message[i] = @shift.set_b_shift(key, date)[@shift.alphabet.find_index(message[i])]}
    (2...message.length).step(4){|i| message[i] = @shift.set_c_shift(key, date)[@shift.alphabet.find_index(message[i])]}
    (3...message.length).step(4){|i| message[i] = @shift.set_d_shift(key, date)[@shift.alphabet.find_index(message[i])]}
    message
  end

  def set_decrypt_message(message, key, date)
    (0...message.length).step(4){|i| message[i] = @shift.alphabet[@shift.set_a_shift(key, date).find_index(message[i])]}
    (1...message.length).step(4){|i| message[i] = @shift.alphabet[@shift.set_b_shift(key, date).find_index(message[i])]}
    (2...message.length).step(4){|i| message[i] = @shift.alphabet[@shift.set_c_shift(key, date).find_index(message[i])]}
    (3...message.length).step(4){|i| message[i] = @shift.alphabet[@shift.set_d_shift(key, date).find_index(message[i])]}
    message
  end
end
