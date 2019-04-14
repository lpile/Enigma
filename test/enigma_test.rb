require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt_method_with_key_and_date
    expected = {  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"}

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_decrypt_method_with_key_and_date
    expected = {  decryption: "hello world",
                  key: "02715",
                  date: "040895"}

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encrypt_method_without_date
    expected = {key: "02715", date: @enigma.shift.date}

    assert_equal expected, @enigma.encrypt("hello world", "02715").delete_if{|k,v| k == :encryption}
  end

  def test_decrypt_method_without_date
    expected = {key: "02715", date: @enigma.shift.date}

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715").delete_if{|k,v| k == :decryption}
  end

  def test_encrypt_method_without_key_and_date
    expected = {key: @enigma.shift.key, date: @enigma.shift.date}

    assert_equal expected, @enigma.encrypt("hello world").delete_if{|k,v| k == :encryption}
  end

  def test_decrypt_method_without_key_and_date
    expected = {key: @enigma.shift.key, date: @enigma.shift.date}

    assert_equal expected, @enigma.decrypt("keder ohulw").delete_if{|k,v| k == :decryption}
  end

end
