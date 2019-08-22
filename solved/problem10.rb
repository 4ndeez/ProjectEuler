require 'benchmark'
require 'prime'

puts Benchmark.measure {
  puts Prime.each(2000000).sum
}
