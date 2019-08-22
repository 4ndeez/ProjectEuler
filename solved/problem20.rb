require 'benchmark'

puts Benchmark.measure {
  puts (1..100).reduce(:*).digits.reduce(:+)
}

