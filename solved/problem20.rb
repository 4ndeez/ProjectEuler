require 'benchmark'

puts Benchmark.measure {
  puts (1..100).reduce(:*).digits.reduce(:+)
}

puts Benchmark.measure {
  puts 1.upto(100).reduce(:*).digits.reduce(:+)
}

puts Benchmark.measure {
  puts 100.downto(1).reduce(:*).digits.reduce(:+)
}
