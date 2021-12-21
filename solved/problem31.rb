require 'benchmark'

def combination_amount(args)
  target = args.last
  ways = Array.new(target + 1, 0)
  ways[0] = 1
  (0..args.length - 1).each { |i| (args[i]..target).each { |j| ways[j] += ways[j - args[i]] } }
  p ways.last
end

Benchmark.bm { |bm| bm.report { combination_amount([1, 2, 5, 10, 20, 50, 100, 200]) } }
#0.0001sec
