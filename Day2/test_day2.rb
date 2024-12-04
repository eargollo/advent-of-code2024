require "minitest/autorun"
require_relative "day2"

class TestDay1 < Minitest::Test
  def setup
    @day2 = Day2.new(file: "testinput.data")
  end

  def test_instantiate
    expected = [
      [7, 6, 4, 2, 1],
      [1, 2, 7, 8, 9],
      [9, 7, 6, 2, 1],
      [1, 3, 2, 4, 5],
      [8, 6, 4, 4, 1],
      [1, 3, 6, 7, 9]
    ]
    assert_equal expected, @day2.reports
  end

  def test_report_with_zero_diff_fails
    assert_equal false, @day2.validate_report([1, 1, 2, 3, 4])
    assert_equal false, @day2.validate_report([4, 4, 3, 2, 1])
    assert_equal false, @day2.validate_report([1, 2, 2, 3, 4])
    assert_equal false, @day2.validate_report([4, 3, 2, 1, 1])
  end

  def test_report_with_increase_and_decrese_fails
    assert_equal false, @day2.validate_report([1, 2, 4, 3, 2])
    assert_equal false, @day2.validate_report([4, 3, 2, 1, 3])
  end

  def test_report_with_big_increase_or_decrease_fails
    assert_equal false, @day2.validate_report([1, 2, 3, 7, 8])
    assert_equal false, @day2.validate_report([1, 7, 8, 9, 10])
    assert_equal false, @day2.validate_report([20, 18, 14, 13, 12])
  end

  def test_report_invalid_even_with_dampener
    assert_equal false, @day2.validate_report_dampener([1, 2, 7, 8, 9])
    assert_equal false, @day2.validate_report_dampener([9, 8, 7, 2, 1])
  end

  def test_report_valid_with_dampener
    assert_equal true, @day2.validate_report_dampener([1, 3, 2, 4, 5])
    assert_equal true, @day2.validate_report_dampener([2, 1, 2, 4, 5])
    assert_equal true, @day2.validate_report_dampener([8, 6, 4, 4, 1])
  end

  def test_part1
    assert_equal @day2.part1, 2
  end

  def test_part2
    assert_equal  @day2.part2, 4
  end
end
