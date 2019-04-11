require 'date'

class Enigma
  attr_reader :random_key, :today

  def initialize
    @today = DateTime.now.strftime "%d%m%y"
    @random_key = 5.times.map{rand(10)}.join
  end

  # encrypt(input_message, input_key = random_key, date = today)
  # input_message arg takes a message string
  # input_key arg is optional and default is random key
  # date arg is optional and default is today's date

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
  def alphabet_array
    ("a".."z").to_a << " "
  end

  def last_four(date)
    (date.to_i**2).to_s[-4..-1]
  end

  def set_a_shift(key, date)
    shift_key = key[0..1].to_i
    offset_key = last_four(date)[0].to_i
    shift_key + offset_key
  end

  def set_b_shift(key, date)
    shift_key = key[1..2].to_i
    offset_key = last_four(date)[1].to_i
    shift_key + offset_key
  end

  def set_c_shift(key, date)
    shift_key = key[2..3].to_i
    offset_key = last_four(date)[2].to_i
    shift_key + offset_key
  end

  def set_d_shift(key, date)
    shift_key = key[3..4].to_i
    offset_key = last_four(date)[3].to_i
    shift_key + offset_key
  end
end
