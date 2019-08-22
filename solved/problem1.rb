require 'benchmark'
require 'prime'

puts Benchmark.measure {
  (1..999).sum { |n| n % 3 == 0 || n % 5 == 0 ? n : 0 }
}
