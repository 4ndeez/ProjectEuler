require 'benchmark'

puts Benchmark.measure {
  longest = 0
  (2...1000).map do |i|
    puts "#{i}: #{1.0/i}"
  end
}
