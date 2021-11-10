require 'benchmark'

def find_produce(ary)
  index, result = 1, 1
  (1..6).each { |i| result *= ary[index *= 10].to_i }
  result
end

puts Benchmark.measure {
  array = (0..1_000_000).to_a.reduce { |m, i| m.to_s << i.to_s }
  p find_produce(array)
}
