require 'benchmark'
puts Benchmark.measure {
  # sum_sq = 0
  # sq_sum = 0
  # for i in 1..100
  #   sum_sq += i**2
  #   sq_sum += i
  # end
  # puts sq_sum**2 - sum_sq

  (1..100).reduce(:+)**2 - (1..100).reduce { |sum, n| sum + n**2 }
}
