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

puts Benchmark.measure {
  abundant_nums = []
  (2...28123).map {|n| abundant_nums << n if factors_of(n).sum > n}
  p abundant_nums
}
