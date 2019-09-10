require 'benchmark'

puts Benchmark.measure {
  (0..9).to_a.permutation(9).with_index {|n, i| (p n.join; break) if i == 999999}
}
