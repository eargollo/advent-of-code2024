require "minitest/autorun"
require_relative "day"

class TestDay < Minitest::Test
  def setup
    @day = Day.new(file: "testinput.data")
  end

  def test_part1
    assert_equal @day.part1, 322
  end

  def test_part2
    input = ["xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"]
    day = Day.new(data: input)

    assert_equal day.part2, 48
  end
end
