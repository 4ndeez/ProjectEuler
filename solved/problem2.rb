require 'benchmark'
# method 1
puts Benchmark.measure {
  arr = [1, 2]
  term = 0
  sum = 2
  while term < 4000000000001
    term = arr[-1] + arr[-2]
    arr << term
    sum += term if term % 2 == 0
  end
  puts sum
}

# method 2, better
puts Benchmark.measure {
  a1, a2 = 2, 3
  sum = 2
  while (a3 = a1 + a2) <= 4_000_000_000_000
    sum += a3 if a3 % 2 == 0
    a1, a2 = a2, a3
  end
  puts sum
}