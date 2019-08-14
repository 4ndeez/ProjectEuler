require 'benchmark'
puts Benchmark.measure {
  arr = []
  for i in 100..999
    for j in 100..999
      pal = i * j
      arr << pal if pal == pal.to_s.reverse.to_i
    end
  end
  puts arr.max
}

def palindrome
  (999 * 999).downto(1) do |n|
    n_str = n.to_s
    next unless n_str == n_str.reverse

    999.downto(100) do |m1|
      break if n / m1 > 999

      return [n, m1] if n % m1 == 0
    end
  end
end

puts Benchmark.measure {
 puts palindrome
}