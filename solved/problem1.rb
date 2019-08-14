require 'benchmark'
require 'prime'
puts Benchmark.measure {
  # sum = 0
  # for i in 1...1000
  #   sum += i if i % 3 == 0 || i % 5 == 0
  # end
  # puts sum
  (1..999).sum { |n| n % 3 == 0 || n % 5 == 0 ? n : 0 }
}
