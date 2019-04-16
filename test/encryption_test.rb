require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption'
require './lib/shift'

class EncryptionTest < Minitest::Test

  def setup
    @shift = Shift.new
    @shift.key = "02715"
    @shift.date = "040895"
    @encryption_1 = Encryption.new("hello world", @shift)
    @encryption_2 = Encryption.new("HELLO WORLD", @shift)
    @encryption_3 = Encryption.new("hello, world!", @shift)
  end

  def test_it_exists
    assert_instance_of Encryption, @encryption_1
  end

  def test_it_can_set_encrypt_message
    assert_equal "keder ohulw", @encryption_1.message
  end

  def test_it_can_set_encrypt_message_with_uppercase
    assert_equal "keder ohulw", @encryption_2.message
  end

  def test_it_can_set_encrypt_message_with_special_character
    assert_equal "keder,sprrdx!", @encryption_3.message
  end

end
