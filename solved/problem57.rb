require 'benchmark'

# I find out that next denominator is current known denominator multiplied by 2 plus previous denominator
# To find next numerator you have to summarize denominator you just calculated + previous one
def next_root(current_denom, previous_denom)
  denom = current_denom * 2 + previous_denom
  num = denom + current_denom
  [num, denom]
end

def exceeding_numerators(last_expansion)
  # first two fractions
  numerators = [3, 7]
  denominators = [2, 5]
  counter = 0
  (1..last_expansion).each do |i|
    root = next_root(denominators[i], denominators[i - 1])
    numerators.push(root[0]) && denominators.push(root[1])
    counter += 1 if root[0].to_s.size > root[1].to_s.size
  end
  counter
end

Benchmark.bm { |bm| bm.report { exceeding_numerators(1000) } }
# 0.006sec
