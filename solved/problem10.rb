require 'benchmark'
require 'prime'
puts Benchmark.measure {
  # sum = 0
  # Prime.each(2000000) do |p|
  #   sum += p
  # end
  # puts sum

  puts Prime.each(2000000).sum
}
