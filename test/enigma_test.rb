require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    skip
    assert_instance_of Enigma, @enigma
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
