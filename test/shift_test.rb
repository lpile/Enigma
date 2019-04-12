require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shift'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_can_produce_random_key
    assert_equal 5, @shift.key.length
  end

  def test_it_can_produce_alphabet_array
    expected = ("a".."z").to_a << " "

    assert_equal expected, @shift.alphabet_array
  end

  def test_it_can_produce_last_four
    assert_equal "1025", @shift.last_four("040895")
  end

  def test_it_can_set_a_shifts
    a = @shift.alphabet_array.rotate(3)
    assert_equal a, @shift.set_a_shift("02715", "040895")
  end

  def test_it_can_set_b_shifts
    b = @shift.alphabet_array.rotate(27)
    assert_equal b, @shift.set_b_shift("02715", "040895")
  end

  def test_it_can_set_c_shifts
    c = @shift.alphabet_array.rotate(73)
    assert_equal c, @shift.set_c_shift("02715", "040895")
  end

  def test_it_can_set_d_shifts
    d = @shift.alphabet_array.rotate(20)
    assert_equal d, @shift.set_d_shift("02715", "040895")
  end
end
