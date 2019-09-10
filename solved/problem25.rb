require 'benchmark'

def fibonacci_index(size)
  f0, f1, digits_count, index = 0, 1, 0, 1
  while digits_count != size
    f2 = f0 + f1
    f0, f1, index, digits_count = f1, f2, index + 1, f2.to_s.size
  end
  index
end

puts Benchmark.measure {
  p fibonacci_index(1000)
}
