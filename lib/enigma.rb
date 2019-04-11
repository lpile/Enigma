require 'date'

class Enigma
  attr_reader :a_shift, :b_shift, :c_shift, :d_shift

  def initialize
  @encrypt = ""
  @decrypt = ""
  @key = 0
  @date = DateTime.now
  @a_shift = []
  @b_shift = []
  @c_shift = []
  @d_shift = []
  @alphabet_array = ("a".."z").to_a << " "
  @final_shifts = []
  @random_key = rand(10**5).to_s.rjust(5,"0")
  end

  # encrypt(input_message, input_key = random_key, date = @date.strftime "%d%m%y")
  # input_message arg takes a message string
  # input_key arg is optional and default is random key
  # date arg is optional and default is today's date

  # set ivars
  # @key = input_key
  # @date = date

  # set keys and final final_shifts
  # keys = set_keys(input_key)
  # offset_keys = set_offset_keys(date)
  # set_final_shift(keys, offset_keys)

  # set shift keys from message
  # set_shift_keys(input_message)

  # create @encrypt by iterating through a_shift .. d_shift
  # using @final_shifts array to add to each shift by rotating
  # through @alphabet_array
  # build encrypted @encrypt string

  # return hash { :encryption => the encrypted String
  #               :key        => the key used for encryption as a String
  #               :date       => the date used for encryption as a String in the form DDMMYY}


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
  def set_keys(input_key)
    array = []
    input_key.chars.each_cons(2){|a,b| array << a+b}
    array.map(&:to_i)
  end

  def set_offset_keys(date)
    offset_key = (date.to_i**2).to_s
    offset_key.chars[-4..-1].map(&:to_i)
  end

  def set_final_shift(keys, offset_keys)
    @final_shifts = keys.map.with_index{|value,index| value + offset_keys[index]}
  end

  # set_shift_keys(message)
  # iterate through message and set shifts
  # @message = input_message
  # @a_shift << message[0] + 4
  # @b_shift << message[1] + 4
  # @c_shift << message[2] + 4
  # @d_shift << message[3] + 4
end
