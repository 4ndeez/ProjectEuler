require 'benchmark'

def digit_power
  sum = 0
  (1..9).each { |number| (1..25).each { |power| sum += 1 if (number**power).to_s.size == power } }
  p sum
end

Benchmark.bm { |bm| bm.report { digit_power } }
# 0.0001 sec avg
# CONSTRAINTS
# 1 <= n <= 9
# 1 <= power <= 25
