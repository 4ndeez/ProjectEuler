require 'benchmark'


# n < d
def calc
  hash = {}
  target = 8
  (1..5000).each do |n|
    ((n + 1)..5000).each do |d|
      fraction = n / d.to_f
      #next if fraction > 0.428 && fraction < 0.375

      hash["#{n}/#{d}"] = n / d.to_f if n.gcd(d) == 1
    end
  end
  p hash.sort_by { |k, v| v }.to_h.keys.size
end

Benchmark.bm { |bm| bm.report { calc } }
