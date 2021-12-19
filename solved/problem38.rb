require 'benchmark'

class Array
  def repeat?
    each.with_index { |i, i_index| self[(i_index + 1)..size].each { |j| return true if i == j } }
    false
  end
end

def pandigital_product
  digits = []
  result = []
  (1..10_000).each do |number|
    10.times do |time|
      multiply_result = (number * (time + 1)).to_s.split('')
      break if (result + multiply_result).repeat? || multiply_result.include?('0')

      multiply_result.each { |i| result << i }
      digits << result.join.to_i if result.size == 9
    end
    result = []
  end
  digits.max
end



Benchmark.bm { |bm| bm.report { pandigital_product } }
#0.04 sec
