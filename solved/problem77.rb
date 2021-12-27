require 'benchmark'
require 'prime'

def combination_amount(args)
  target = args.last
  ways = Array.new(target + 1, 0)
  ways[0] = 1
  (0..args.length - 1).each { |i| (args[i]..target).each { |j| ways[j] += ways[j - args[i]] } }
  ways.last - 1 # excluding target
end

def max_prime_value(ways)
  (10..Float::INFINITY).each do |number|
    primes = Prime.each(number).to_a
    return number if combination_amount(primes.push(number)) > ways
  end
  false
end

Benchmark.bm { |bm| bm.report { p max_prime_value(5_000) } }
#0.002sec

