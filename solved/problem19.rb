require 'benchmark'
require 'date'

def sundays(date)
  counter = 0
  while date.year < 2001
    counter += 1 if date.sunday?
    date = date.next_month
  end
  counter
end

puts Benchmark.measure {
  p sundays(Date.new(1901, 1, 1))
}

