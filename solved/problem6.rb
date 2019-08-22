require 'benchmark'

puts Benchmark.measure {
  (1..100).reduce(:+)**2 - (1..100).reduce { |sum, n| sum + n**2 }
}
