require 'benchmark'
numbers_array = []
def divisors_sum(number, sum1 = 0, sum2 = 0)
  (1...number).map do |div|
    sum1 += div if number % div == 0
  end
  (1...sum1).map do |div|
    sum2 += div if sum1 % div == 0
  end
  if sum2 == number && number != sum1
    number
  end
end

puts Benchmark.measure {

  (1..10000).map do |number|
    result = divisors_sum(number)
    numbers_array << result unless result.nil?
  end
  p numbers_array.sum
}
