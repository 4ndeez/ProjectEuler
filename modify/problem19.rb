require 'benchmark'
require 'date'

puts Benchmark.measure {
  sundays_count = 0
  date = Date.new(1901, 1, 1)
  while date.year < 2001
    sundays_count += 1 if date.sunday?
    date = date.next_month
  end
  p sundays_count
}
