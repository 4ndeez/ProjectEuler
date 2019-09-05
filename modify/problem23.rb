require 'benchmark'
require 'prime'

class Array
  def custom_combination(amount)
    ary = []
    counter = 0
    arr = self.dup
    arr.map do |i|
      arr.map do |j|
        # next if j < i
        ary << [i, j]
      end
      arr.shift
    end
    ary
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
  p [1, 2, 3, 4, 5].custom_combination(1)
  # abundant_nums = []
  # (2..28123).map {|n| abundant_nums << n if factors_of(n).sum > n}
  # abundant_sums = abundant_nums.custom_combination(2).map(&:sum).uniq
  # p abundant_sums
  # ary = (1..28123).to_a
  # ary -= abundant_sums
  # #ary.delete_if {|n| abundant_sums.include?(n)}
  # p [abundant_sums.size, ary.size]
  # p ary.sum
}
