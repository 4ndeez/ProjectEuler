require 'benchmark'
require 'prime'

def power_triple(target)
  result_array = [] # using array to exclude similar numbers
  upper_number = Math.sqrt(target).to_i
  primes = Prime.each(upper_number).to_a # sqrt(50_000_000) ~ 7070, so will take 7070 as max number to raise in power
  primes.each do |d|
    double = d**2
    primes.each do |t|
      triple = t**3
      break if double + triple > target

      primes.each do |q|
        quad = q**4
        number = double + triple + quad
        break if number > target

        result_array << number if number < target
      end
    end
  end
  p result_array.uniq.size
end

Benchmark.bm { |bm| bm.report { power_triple(50_000_000) } }

# 55sec for brute force
# 4sec 1 break
# 0.24 2 breaks