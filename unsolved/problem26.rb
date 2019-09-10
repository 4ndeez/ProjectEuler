require 'benchmark'

puts Benchmark.measure {
  array1 = []
  array2 = []
  (2...100).map do |i|
    number = 1.0 / i
    puts "#{i}: #{number} #{number.to_s.size - 1} chars"

  end
}
