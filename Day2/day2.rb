require 'scanf'

file = "input.data"
# file = "testinput.data"


class Day2
  def initialize(file: nil, data: nil)
    data = data || File.readlines(file)
    @reports = []
    data.each do |line|
      @reports << line.strip.split.map(&:to_i)
    end
  end

  def validate_report(report)
    factor = report[0] < report[1] ? 1 : -1

    report[1..].each_with_index do |a, i|
      # puts "#{factor} * (#{a} - #{report[i]}) == #{factor * (a - report[i])}"
      return false if factor * (a - report[i]) <= 0 || factor * (a - report[i]) > 3
    end

    true
  end

  def validate_report_dampener(report)
    if validate_report(report)
      return true
    end

    report.each_with_index do |a, i|
      new_report = report.dup
      new_report.delete_at(i)

      # puts "new_report: #{new_report} #{validate_report(new_report)}"
      return true if validate_report(new_report)
    end

    false
  end

  def reports
    @reports
  end

  def part1
    total = 0
    @reports.each do |report|
      total += 1 if validate_report(report)
    end

    return total
  end

  def part2
    total = 0
    @reports.each do |report|
      total += 1 if validate_report_dampener(report)
    end

    total
  end
end


day2 = Day2.new(file: file)
puts "Part 1 result: #{day2.part1}"
puts "Part 2 result: #{day2.part2}"
