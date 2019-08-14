require 'benchmark'
require 'prime'
puts Benchmark.measure {
  value = 1
  counter = 0
  while true
    (1..value).reduce(:+) do |num|
      counter.succ if value % num == 0
      p value
    end
    counter > 500 ? break : counter = 0
    value += 1
  end
}
