require 'benchmark'

def distinct_terms(range)
  result = []
  range.map { |i| range.map { |j| result << i**j } }
  result.uniq.size
end

puts Benchmark.measure {
  p distinct_terms(2..100)
}
