require 'date'

class Enigma
  attr_reader :key, :date

  def initialize
    @key = 5.times.map{rand(10)}.join
    @date = DateTime.now.strftime "%d%m%y"
  end

  def encrypt(input_message, input_key = key, input_date = date)
    @key = input_key; @date = input_date
    encrypt_message = {}
    message = set_encrypt_message(input_message, input_key, input_date)
    encrypt_message = {encryption: message, key: input_key, date: input_date}
  end

  def decrypt(input_message, input_key = key, input_date = date)
    @key = input_key; @date = input_date
    decrypt_message = {}
    message = set_decrypt_message(input_message, input_key, input_date)
    decrypt_message = {decryption: message, key: input_key, date: input_date}
  end

  def set_encrypt_message(message, key, date)
    (0...message.length).step(4){|i| message[i] = set_a_shift(key, date)[alphabet_array.find_index(message[i])]}
    (1...message.length).step(4){|i| message[i] = set_b_shift(key, date)[alphabet_array.find_index(message[i])]}
    (2...message.length).step(4){|i| message[i] = set_c_shift(key, date)[alphabet_array.find_index(message[i])]}
    (3...message.length).step(4){|i| message[i] = set_d_shift(key, date)[alphabet_array.find_index(message[i])]}
    message
  end

  def set_decrypt_message(message, key, date)
    (0...message.length).step(4){|i| message[i] = alphabet_array[set_a_shift(key, date).find_index(message[i])]}
    (1...message.length).step(4){|i| message[i] = alphabet_array[set_b_shift(key, date).find_index(message[i])]}
    (2...message.length).step(4){|i| message[i] = alphabet_array[set_c_shift(key, date).find_index(message[i])]}
    (3...message.length).step(4){|i| message[i] = alphabet_array[set_d_shift(key, date).find_index(message[i])]}
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
