require 'benchmark'

result_hash = {}
# method 1
puts Benchmark.measure {
  File.read('../input/problem22.txt').delete('"').split(',').sort.each_with_index {|n, index| result_hash[n] = n.bytes.reduce(0) {|sum, i| sum += (index + 1) * (i - 64)}}
  p result_hash.values.sum
}
# method 2, faster
puts Benchmark.measure {
  p File.read('../input/problem22.txt').delete('"').split(',').sort.each_with_index.reduce(0) {|sum, (n, index)| sum += (n.sum - (n.size * 64)) * (index + 1)}
}
