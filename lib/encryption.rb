class Encryption
  attr_reader :message

  def initialize(message, shift)
    @message = message
    @shift = shift
    set_encrypt_message
  end

  def summary
    {encryption: @message, key: @shift.key, date: @shift.date}
  end

  def set_encrypt_message
    (0...@message.length).step(4){|i| @message[i] = change_a(i)}
    (1...@message.length).step(4){|i| @message[i] = change_b(i)}
    (2...@message.length).step(4){|i| @message[i] = change_c(i)}
    (3...@message.length).step(4){|i| @message[i] = change_d(i)}
  end

  def change_a(letter)
    @shift.set_a_shift(@shift.key, @shift.date)[find(letter)]
  end

  def change_b(letter)
    @shift.set_b_shift(@shift.key, @shift.date)[find(letter)]
  end

  def change_c(letter)
    @shift.set_c_shift(@shift.key, @shift.date)[find(letter)]
  end

  def change_d(letter)
    @shift.set_d_shift(@shift.key, @shift.date)[find(letter)]
  end

  def find(letter)
    @shift.alphabet.find_index(@message[letter])
  end
end
