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
    @decryption = Decryption.new("keder ohulw", @shift)
  end

  def test_it_exists
    assert_instance_of Decryption, @decryption
  end

  def test_it_can_set_decrypt_message
    assert_equal "hello world", @decryption.message
  end
  
end
