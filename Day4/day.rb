require 'scanf'

file = "input.data"

class Day
  attr_reader :data

  VALID_TOKENS = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "(", ")", ",", "m", "o", "v"]

  def initialize(file: nil, data: nil)
    @data = data || File.readlines(file)
  end

  def is_xmas?(row, col, dir_row, dir_col)
    word = "XMAS"
    word.each_char do |char|
      return false if row < 0 || row >= @data.length || col < 0 || col >= @data[row].length
      # puts "row: #{row}, col: #{col}, char: #{@data[row][col]} == #{char}"
      return false unless @data[row][col] == char
      row += dir_row
      col += dir_col
    end
    true
  end

  def is_mas?(row, col, dir_row, dir_col)
    word = "MAS"

    row -= dir_row
    col -= dir_col

    word.each_char do |char|
      return false if row < 0 || row >= @data.length || col < 0 || col >= @data[row].length
      # puts "row: #{row}, col: #{col}, char: #{@data[row][col]} == #{char}"
      return false unless @data[row][col] == char
      row += dir_row
      col += dir_col
    end
    true
  end

  def is_x_mas?(row, col)
    (is_mas?(row, col, -1, -1) || is_mas?(row, col, 1, 1)) && (is_mas?(row, col, 1, -1) || is_mas?(row, col, -1, 1))
  end

  def xmas_at_position(row, col)
    total = 0
    [-1, 0, 1].each do |dir_row|
      [-1, 0, 1].each do |dir_col|
        next if dir_row == 0 && dir_col == 0
        total += 1 if is_xmas?(row, col, dir_row, dir_col)
        # puts "row: #{row}, col: #{col}, dir_row: #{dir_row}, dir_col: #{dir_col}, total: #{total}"
      end
    end
    total
  end

  def part1
    total = 0
    @data.each_with_index do |row, row_index|
      row.chars.each_with_index do |char, col_index|
        total += xmas_at_position(row_index, col_index) if char == "X"
      end
    end
    total
  end

  def part2
    total = 0
    @data.each_with_index do |row, row_index|
      row.chars.each_with_index do |char, col_index|
        total += 1 if char == "A" && is_x_mas?(row_index, col_index)
      end
    end
    total
  end
end


day = Day.new(file: file)
puts "Part 1 result: #{day.part1}"
puts "Part 2 result: #{day.part2}"
