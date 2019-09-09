require 'benchmark'
require 'prime'

class Array
  def custom_combination
    ary = []
    self.map.with_index do |i, index|
      self[index..(self.size - 2) - index].map do |j|
        ary << i + j
      end
    end
    ary.uniq
  end
end

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
  (2..28123).map {|n| abundant_nums << n if factors_of(n).sum > n}
  abundant_sums = abundant_nums.custom_combination
  p ((1..28123).to_a - abundant_sums).sum
}
