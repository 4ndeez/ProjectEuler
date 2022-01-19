require 'prime'
require 'benchmark'

def prime_permutation?(ary)
  ary.permutation(2).each { |perm| return false unless perm.join.to_i.prime? }
  true
end

def find_pair_sets
  primes = Prime.each(10_000).to_a

  primes.each.with_index do |a, a_index|
    primes[a_index + 1..primes.size].each.with_index do |b, b_index|
      next unless prime_permutation?([a, b])

      primes[b_index + 1..primes.size].each.with_index do |c, c_index|
        next unless prime_permutation?([a, b, c])

        primes[c_index + 1..primes.size].each.with_index do |d, d_index|
          next unless prime_permutation?([a, b, c, d])

          primes[d_index + 1..primes.size].each do |e|
            next unless prime_permutation?([a, b, c, d, e])

            return [a + b + c + d + e, [a, b, c, d, e]]
          end
        end
      end
    end
  end
end


Benchmark.bm { |bm| bm.report { p find_pair_sets } }
