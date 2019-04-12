require 'date'

class Shift
  attr_accessor :key, :date

  def initialize
    @key = 5.times.map{rand(10)}.join
    @date = DateTime.now.strftime "%d%m%y"
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def last_four(date)
    (date.to_i**2).to_s[-4..-1]
  end

  def set_a_shift(key, date)
    shift_key = key[0..1].to_i
    offset_key = last_four(date)[0].to_i
    alphabet.rotate(shift_key + offset_key)
  end

  def set_b_shift(key, date)
    shift_key = key[1..2].to_i
    offset_key = last_four(date)[1].to_i
    alphabet.rotate(shift_key + offset_key)
  end

  def set_c_shift(key, date)
    shift_key = key[2..3].to_i
    offset_key = last_four(date)[2].to_i
    alphabet.rotate(shift_key + offset_key)
  end

  def set_d_shift(key, date)
    shift_key = key[3..4].to_i
    offset_key = last_four(date)[3].to_i
    alphabet.rotate(shift_key + offset_key)
  end
end
