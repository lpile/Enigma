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
    assert_equal 5, @enigma.random_key.length
  end

  def test_it_can_produce_alphabet_array
    expected = ("a".."z").to_a << " "

    assert_equal expected, @enigma.alphabet_array
  end

  def test_it_can_produce_last_four
    assert_equal "1025", @enigma.last_four("040895")
  end

  def test_it_can_set_shifts
    assert_equal 3, @enigma.set_a_shift("02715", "040895")
    assert_equal 27, @enigma.set_b_shift("02715", "040895")
    assert_equal 73, @enigma.set_c_shift("02715", "040895")
    assert_equal 20, @enigma.set_d_shift("02715", "040895")
  end

  def test_encrypt_method_with_key_and_date
    skip
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

  def test_encrypt_method_with_key_and_todays_date
    skip
    expected = {  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"}

    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_decrypt_method_with_key_and_todays_date
    skip
    expected = {  decryption: "hello world",
                  key: "02715",
                  date: ""}

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715")
  end

  def test_encrypt_method_with_key_and_todays_date
    skip
    expected = {  encryption: "keder ohulw",
                  key: "02715",
                  date: ""}

    assert_equal expected, @enigma.encrypt("hello world")
  end
end
