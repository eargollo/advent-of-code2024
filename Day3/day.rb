require 'scanf'

file = "input.data"
# file = "testinput.data"


class Day
  attr_reader :instructions
  VALID_TOKENS = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "(", ")", ",", "m", "o", "v"]
  def initialize(file: nil, data: nil)
    @instructions = data || File.readlines(file)
    @instructions = @instructions.join(" ").strip
  end

  def next_instruction(pointer=0)
    m = @instructions.index(/mul\(\d+,\d+\)/, pointer)
    d = @instructions.index("do()", pointer)
    dn = @instructions.index("don't()", pointer)

    [m, d, dn].compact.min
  end

  def part1
    total = 0
    pointer = 0

    while (pointer = next_instruction(pointer)) != nil
      instruction = @instructions[pointer..]
      if instruction[0..2] == "mul"
        values = instruction.scanf("mul(%d,%d)")
        total += values[0] * values[1]
      end
      pointer += 1
    end

    total
  end

  def part2
    total = 0
    pointer = 0
    execute = true

    while (pointer = next_instruction(pointer)) != nil
      instruction = @instructions[pointer..]
      if instruction[0..2] == "mul"
        if execute
          values = instruction.scanf("mul(%d,%d)")
          total += values[0] * values[1]
        end
      elsif instruction[0..3] == "do()"
        execute = true
      elsif instruction[0..6] == "don't()"
        execute = false
      end
      pointer += 1
    end

    total
  end
end


day = Day.new(file: file)
puts "Part 1 result: #{day.part1}"
puts "Part 2 result: #{day.part2}"
