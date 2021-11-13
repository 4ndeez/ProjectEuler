require 'benchmark'

def max_digit_sum(from, to)
  array = []
  (from..to).each { |a| (from..to).each { |b| array << (a**b).digits.sum } }
  array.max
end

Benchmark.bm do |benchmark|
  benchmark.report { max_digit_sum(1, 99) }
end
