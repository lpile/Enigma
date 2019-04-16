require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryption'
require './lib/shift'

class DecryptionTest < Minitest::Test

  def setup
    @shift = Shift.new
    @shift.key = "02715"
    @shift.date = "040895"
    @decryption_1 = Decryption.new("keder ohulw", @shift)
    @decryption_2 = Decryption.new("keder,sprrdx!", @shift)
  end

  def test_it_exists
    assert_instance_of Decryption, @decryption_1
  end

  def test_it_can_set_decrypt_message
    assert_equal "hello world", @decryption_1.message
  end

  def test_it_can_set_encrypt_message_with_special_character
    assert_equal "hello, world!", @decryption_2.message
  end

end
