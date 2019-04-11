require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists_and_attributes
    assert_instance_of Enigma, @enigma
    assert_equal [], @enigma.a_shift
    assert_equal [], @enigma.b_shift
    assert_equal [], @enigma.c_shift
    assert_equal [], @enigma.d_shift
  end

  def test_it_can_set_keys
    expected = ['02', '27', '71', '15']

    assert_equal expected, @enigma.set_keys("02715")
  end

  def test_it_can_set_offset_keys
    expected = ['1', '0', '2', '5']

    assert_equal expected, @enigma.set_offset_keys("040895")
  end

  def test_it_can_set_final_shifts
    skip
    keys = ['1', '0', '2', '5']
    offset_keys = ['02', '27', '71', '15']
    expected = ['3', '27', '73', '20']

    assert_equal expected, @enigma.set_final_shift(keys, offset_keys)
  end

  def test_it_can_set_letter_shifts
    skip
    @enigma.set_shift_keys("hello world")
    a_shift = ['h', 'o', 'r']
    b_shift = ['e', '', 'l']
    c_shift = ['l', 'w', 'd']
    d_shift = ['l', 'o']

    assert_equal a_shift, @enigma.a_shift
    assert_equal b_shift, @enigma.b_shift
    assert_equal c_shift, @enigma.c_shift
    assert_equal d_shift, @enigma.d_shift
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
