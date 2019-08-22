require 'benchmark'
# method 1, chars, faster
puts Benchmark.measure {
  p (2**1000).to_s.chars.map { |n| n.to_i }.reduce(:+)
}
# method 2, digits
puts Benchmark.measure {
  p (2**1000).digits.sum
}
