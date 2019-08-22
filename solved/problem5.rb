require 'benchmark'

puts Benchmark.measure {
  puts (1..20).reduce(:lcm)
}
