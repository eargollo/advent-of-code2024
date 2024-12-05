require "minitest/autorun"
require_relative "day"

class TestDay < Minitest::Test
  def setup
    @day = Day.new(file: "testinput.data")
    @day2 = Day.new(file: "testinput2.data")
  end

  def test_vertical_down
    day = Day.new(data: [
      "..X..",
      "..M..",
      "..A..",
      "..S..",
      ".....",
    ])
    assert_equal true, day.is_xmas?(0, 2, 1, 0)
  end

  def test_vertical_down_fail_with_cross_boundaries
    day = Day.new(data: [
      "..A..",
      "..S..",
      ".....",
      "..X..",
      "..M..",
    ])
    assert_equal false, day.is_xmas?(3, 2, 1, 0)
  end

  def test_vertical_up
    day = Day.new(data: [
      ".....",
      "..S..",
      "..A..",
      "..M..",
      "..X..",
    ])
    assert_equal true, day.is_xmas?(4, 2, -1, 0)
  end

  def test_horizontal_right
    day = Day.new(data: [
      ".....",
      "..XMAS..",
      ".....",
      ".....",
      ".....",
    ])
    assert_equal true, day.is_xmas?(1, 2, 0, 1)
  end

  def test_diagonals
    directions = [
      [1, 3, 1, 1],
      [4, 6, -1, -1],
      [1, 4, 1, -1],
      [4, 1, -1, 1],
    ]
    datas = [
      [
        ".........",
        "...X.....",
        "....M....",
        ".....A...",
        "......S..",
      ],
      [
        ".........",
        "...S.....",
        "....A....",
        ".....M...",
        "......X..",
      ],
      [
        ".........",
        "....X....",
        "...M.....",
        "..A......",
        ".S.......",
      ],
      [
        ".........",
        "....S....",
        "...A.....",
        "..M......",
        ".X.......",
      ],
    ]

    datas.each_with_index do |data, index|
      day = Day.new(data: data)
      assert_equal true,
        day.is_xmas?(directions[index][0], directions[index][1], directions[index][2], directions[index][3]),
        "data: #{data}, direction: #{directions[index]}"
    end
  end

  def test_xmas_at_position
    directions = [
      [1, 3, 1],
      [4, 6, 2],
      [1, 4, 3],
      [3, 4, 8],
    ]
    datas = [
      [
        ".........",
        "...X.....",
        "....M....",
        ".....A...",
        "......S..",
      ],
      [
        ".........",
        "...S.....",
        "....A....",
        ".....M...",
        "...SAMX..",
      ],
      [
        ".........",
        "....XMAS.",
        "...MM....",
        "..A.A....",
        ".S..S....",
      ],
      [
        ".S..S..S.",
        "..A.A.A..",
        "...MMM...",
        ".SAMXMAS.",
        "...MMM...",
        "..A.A.A..",
        ".S..S..S.",
      ],
    ]

    datas.each_with_index do |data, index|
      day = Day.new(data: data)
      assert_equal directions[index][2],
        day.xmas_at_position(directions[index][0], directions[index][1]),
        "data: #{data}, direction: #{directions[index]}"
    end
  end

  def test_part1
    assert_equal 18, @day.part1
  end

  def test_find_mas_based_on_a
    day = Day.new(data: [
      ".....",
      "..M..",
      "..A..",
      "..S..",
      ".....",
    ])
    assert_equal true, day.is_mas?(2, 2, 1, 0)
  end

  def test_is_x_mas
    day = Day.new(data: [
      ".....",
      ".M.M.",
      "..A..",
      ".S.S.",
      ".....",
    ])
    assert_equal true, day.is_x_mas?(2, 2)
  end

  def test_part2
    assert_equal 9, @day2.part2
  end
end
