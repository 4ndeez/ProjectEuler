require 'benchmark'

puts Benchmark.measure {
  result = []
  ary = (2..100).to_a
  ary.map {|i| ary.map {|j| result << i**j }}
  p result.uniq.size
}
