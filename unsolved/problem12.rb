require 'benchmark'
require 'prime'
puts Benchmark.measure {
  i = 1
  counter = 0
  while true
    triangle = (1..i).reduce(:+)
    (1..triangle).map do |div|
      next if triangle % triangle/2 != 0
      counter += 1 if triangle % div == 0
      if triangle > 200000
        puts triangle
      end
    end
    puts triangle
    counter = 0
    i += 1
  end
}
