require 'benchmark'
puts Benchmark.measure {
  # p (2**1000).to_s.chars.to_a.reduce(0) { |sum, n| sum += n.to_i }
  p (2**1000000).to_s.chars.map { |n| n.to_i }.reduce(:+)
}
puts Benchmark.measure {
  p (2**1000000).digits.sum
}
puts Benchmark.measure {
  (1..2**1000000).sum
}
