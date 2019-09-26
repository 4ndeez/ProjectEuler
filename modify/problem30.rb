require 'benchmark'

def c_division(num)
  result = 0
  first = num
  loop do
    first, last = first/10, (first % 10)** 5
    result += last
    break if result > num || first == 0
  end
  result
end

puts Benchmark.measure {
  sum = 0
  (1111..200000).map do |n|
    (sum += n; puts n) if n == n.digits.map {|x| x = x**5}.sum
  end
  p sum
}

puts Benchmark.measure {
  puts (1111..200000).select { |i| i == i.digits.map {|j| j = j**5}.sum}.sum
}

puts Benchmark.measure {
  puts (1111..200000).select { |i| i == c_division(i)}.sum
}
