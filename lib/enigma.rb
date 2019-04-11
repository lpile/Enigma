
require 'date'

class Enigma
  attr_reader :key, :date

  def initialize
    @key = 5.times.map{rand(10)}.join
    @date = DateTime.now.strftime "%d%m%y"
  end

  def encrypt(input_message, input_key = key, input_date = date)
    encrypt_message = {}
    message = set_encrypt_message(input_message, input_key, input_date)
    encrypt_message = {encryption: message, key: input_key, date: input_date}
  end

  # decrypt(ciphertext, input_key, date = @date.strftime "%d%m%y")
  # ciphertext arg takes a ciphertext String
  # input_key arg is used for encryption
  # date arg is optional and default is today's date

  # check input_key == @key
  # check date == @date
  # check ciphertext == @encrypt

  # create @decrypt by iterating through ciphertext
  # and reverse a_shift .. d_shift using @final_shifts array
  # and build original message

  # return hash { :encryption => the decrypted String
  #               :key        => the key used for encryption as a String
  #               :date       => the date used for decryption as a String in the form DDMMYY}

  ###########HELPER METHODS################
  def set_encrypt_message(message, key, date)
    (0...message.length).step(4){|i| message[i] = set_a_shift(key, date)[alphabet_array.find_index(message[i])]}
    (1...message.length).step(4){|i| message[i] = set_b_shift(key, date)[alphabet_array.find_index(message[i])]}
    (2...message.length).step(4){|i| message[i] = set_c_shift(key, date)[alphabet_array.find_index(message[i])]}
    (3...message.length).step(4){|i| message[i] = set_d_shift(key, date)[alphabet_array.find_index(message[i])]}
    message
  end

  def alphabet_array
    ("a".."z").to_a << " "
  end

  def last_four(date)
    (date.to_i**2).to_s[-4..-1]
  end

  def set_a_shift(key, date)
    shift_key = key[0..1].to_i
    offset_key = last_four(date)[0].to_i
    alphabet_array.rotate(shift_key + offset_key)
  end

  def set_b_shift(key, date)
    shift_key = key[1..2].to_i
    offset_key = last_four(date)[1].to_i
    alphabet_array.rotate(shift_key + offset_key)
  end

  def set_c_shift(key, date)
    shift_key = key[2..3].to_i
    offset_key = last_four(date)[2].to_i
    alphabet_array.rotate(shift_key + offset_key)
  end

  def set_d_shift(key, date)
    shift_key = key[3..4].to_i
    offset_key = last_four(date)[3].to_i
    alphabet_array.rotate(shift_key + offset_key)
  end
end
