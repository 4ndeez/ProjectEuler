require 'benchmark'
require 'prime'

def factors_of(number)
  return [1] if number == 1
  primes, powers = number.prime_division.transpose
  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end
  divisors.pop
  divisors
end

def divisors_sum(number)
  sum1 = factors_of(number).sum
  sum2 = factors_of(sum1).sum
  if sum2 == number && number != sum1
    number
  end
end

puts Benchmark.measure {
  numbers_array = []

  (2..10000).map do |number|
    result = divisors_sum(number)
    numbers_array << result unless result.nil?
  end

  p numbers_array.sum
}
