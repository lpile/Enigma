class Decryption

  attr_reader :message

  def initialize(message, shift)
    @message = message.downcase
    @shift = shift
    set_decrypt_message
  end

  def summary
    {decryption: @message, key: @shift.key, date: @shift.date}
  end

  def set_decrypt_message
    (0...@message.length).step(4){|index| @message[index] = change_a(index) if @shift.alphabet.include?(@message[index])}
    (1...@message.length).step(4){|index| @message[index] = change_b(index) if @shift.alphabet.include?(@message[index])}
    (2...@message.length).step(4){|index| @message[index] = change_c(index) if @shift.alphabet.include?(@message[index])}
    (3...@message.length).step(4){|index| @message[index] = change_d(index) if @shift.alphabet.include?(@message[index])}
  end

  def change_a(index)
    @shift.set_a_shift(@shift.key, @shift.date, true)[find(index)]
  end

  def change_b(index)
    @shift.set_b_shift(@shift.key, @shift.date, true)[find(index)]
  end

  def change_c(index)
    @shift.set_c_shift(@shift.key, @shift.date, true)[find(index)]
  end

  def change_d(index)
    @shift.set_d_shift(@shift.key, @shift.date, true)[find(index)]
  end

  def find(index)
    @shift.alphabet.find_index(@message[index])
  end

end
