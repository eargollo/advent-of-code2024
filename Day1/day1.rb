require 'scanf'

file = "input.data"
# file = "testinput.data"


class Day1
  def initialize(file: nil, data: nil)
    data = data || File.readlines(file)
    input = data.each.map { |line| line.strip.scanf("%d%d") }.transpose
    @left = input[0].sort
    @right = input[1].sort
  end

  def part1
    total = 0
    @left.each_with_index do |a, i|
      total = total + (@right[i] - a).abs
    end

    return total
  end

  def part2
    frequency = Hash.new(0)
    @right.each do |a|
      frequency[a] = frequency[a] + 1
    end

    total = 0
    @left.each do |a|
      total += a*frequency[a]
    end

    total
  end
end


day1 = Day1.new(file: file)
puts "Part 1 result: #{day1.part1}"
puts "Part 2 result: #{day1.part2}"
