require 'benchmark'
require 'prime'

class Array
  def divisors
    each { |array| array.pop if array.last == 1 }
  end
end

def consecutive_distinct_factors(length)
  result = []
  used_factors = []
  counter = 0
  (2..Float::INFINITY).each do |number|
    factors = number.prime_division.divisors
    if factors.length != length
      result.clear && used_factors.clear
      counter = 0
      next
    end

    factors.each do |f|
      if used_factors.include?(f)
        result.clear && used_factors.clear
        counter = 0
        break
      end
    end
    result.push(number) && used_factors.push(factors)
    counter += 1

    return result if counter == length
  end
end

Benchmark.bmbm do |bm|
  bm.report('answer:') { p consecutive_distinct_factors(4).first }
end
