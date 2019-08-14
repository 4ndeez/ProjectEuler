require 'benchmark'
puts Benchmark.measure {
  # (1..20).reduce(1, :lcm)
  puts (1..20).reduce(:lcm)
}
