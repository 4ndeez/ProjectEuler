require 'benchmark'
require 'prime'

def circular_primes(num)
  result_ary = []
  flag = false
  Prime.each(num) do |prime|
    prime = prime.to_s.chars
    prime.permutation(prime.size).map do |p|
      p.join('').to_i.prime? ? flag = true : (flag = false; break)
    end
    result_ary << prime.join('').to_i if flag
  end
  result_ary
end

def circular_primes_2(num)
  result_ary = [2, 3, 5, 7]
  flag = false
  Prime.each(num) do |prime|
    prime = prime.to_s.chars
    (prime.size - 1).times do
      val = prime
      val << val.shift
      val.join('').to_i.prime? ? flag = true : (flag = false; break)
    end
    result_ary << prime.join('').to_i if flag
  end
  result_ary.sort
end

puts Benchmark.measure {
  p circular_primes(999999)
}

puts Benchmark.measure {
  p circular_primes_2(999999).size
}
