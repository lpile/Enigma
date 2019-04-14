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
    @encryption = Encryption.new("hello world", @shift)
  end

  def test_it_exists
    assert_instance_of Encryption, @encryption
  end

  def test_it_can_set_encrypt_message
    assert_equal "keder ohulw", @encryption.message
  end

end
