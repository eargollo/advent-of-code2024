require "minitest/autorun"
require_relative "day1"

class TestDay1 < Minitest::Test
  def setup
    @day1 = Day1.new(file: "testinput.data")
  end

  def test_part1
    assert_equal @day1.part1, 11
  end

  def test_part2
    assert_equal @day1.part2, 31
  end
end
