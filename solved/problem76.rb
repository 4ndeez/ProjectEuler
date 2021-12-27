require 'benchmark'

def combination_amount(args)
  target = args.last
  ways = Array.new(target + 1, 0)
  ways[0] = 1
  (0..args.length - 1).each { |i| (args[i]..target).each { |j| ways[j] += ways[j - args[i]] } }
  p ways.last - 1 # -1 is excluding way in which we write 100 as 1 integer(100)
end

Benchmark.bm { |bm| bm.report { combination_amount((1..100).to_a) } }
#0.0003sec
