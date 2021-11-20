require 'benchmark'
require 'prime'

def circular_primes(num)
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
  result_ary.size
end

Benchmark.bm do |bm|
  bm.report { circular_primes(999_999) }
end
