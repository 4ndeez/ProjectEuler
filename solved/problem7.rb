require 'benchmark'
require 'prime'
puts Benchmark.measure {
  # num = 1
  # count = 0
  # while true
  #   count += 1 if num.prime?
  #   if count == 10001
  #     puts num
  #     break
  #   end
  #   num += 1
  # end
  #

  puts Prime.first(10001).last #faster

}


