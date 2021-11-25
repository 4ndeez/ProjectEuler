require 'benchmark'

def fctrl(n)
  (1..n).inject(:*)
end

def combinatoric_selections
  counter = 0
  (1..100).each { |n| (1..(n - 1)).each { |r| counter += 1 if (fctrl(n) / (fctrl(r) * fctrl(n - r))) > 1_000_000 } }
  counter
end

Benchmark.bm { |bm| bm.report { combinatoric_selections } }
# 0.13 sec avg
