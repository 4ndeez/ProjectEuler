require 'benchmark'
require 'prime'

puts Benchmark.measure {
  puts Prime.first(10001).last
}


