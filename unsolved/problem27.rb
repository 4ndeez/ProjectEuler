require 'benchmark'

puts Benchmark.measure {
  p "n:"
  n = gets.chomp.to_i
  puts n**2 + n + 41
}
