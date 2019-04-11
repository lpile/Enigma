require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists_and_attributes
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_produce_random_key
    assert_equal 5, @enigma.key.length
  end

  def test_it_can_produce_alphabet_array
    expected = ("a".."z").to_a << " "

    assert_equal expected, @enigma.alphabet_array
  end

  def test_it_can_produce_last_four
    assert_equal "1025", @enigma.last_four("040895")
  end

  def test_it_can_set_a_shifts
    a = @enigma.alphabet_array.rotate(3)
    assert_equal a, @enigma.set_a_shift("02715", "040895")
  end

  def test_it_can_set_b_shifts
    b = @enigma.alphabet_array.rotate(27)
    assert_equal b, @enigma.set_b_shift("02715", "040895")
  end

  def test_it_can_set_c_shifts
    c = @enigma.alphabet_array.rotate(73)
    assert_equal c, @enigma.set_c_shift("02715", "040895")
  end

  def test_it_can_set_d_shifts
    d = @enigma.alphabet_array.rotate(20)
    assert_equal d, @enigma.set_d_shift("02715", "040895")
  end

  def test_it_can_set_encrypt_message
    assert_equal "keder ohulw", @enigma.set_encrypt_message("hello world", "02715", "040895")
  end

  def test_encrypt_method_with_key_and_date
    expected = {  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"}

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_decrypt_method_with_key_and_date
    skip
    expected = {  decryption: "hello world",
                  key: "02715",
                  date: "040895"}

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encrypt_method_without_date
    expected = {key: "02715",date: @enigma.date}

    assert_equal expected, @enigma.encrypt("hello world", "02715").delete_if{|k,v| k == :encryption}
  end

  def test_decrypt_method_without_date
    skip
    expected = {  decryption: @enigma.decrypt_string,
                  key: "02715",
                  date: @enigma.date}

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715")
  end

  def test_encrypt_method_without_key_and_date
    expected = {key: @enigma.key,
                date: @enigma.date}

    assert_equal expected, @enigma.encrypt("hello world").delete_if{|k,v| k == :encryption}
  end

  def test_decrypt_method_without_key_and_date
    skip
    expected = {  encryption: @enigma.decrypt_string,
                  key: @enigma.key,
                  date: @enigma.date}

    assert_equal expected, @enigma.decrypt("keder ohulw")
  end
end
