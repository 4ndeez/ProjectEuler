require 'prime'
require 'benchmark'

def relatively_primes(number)
  r_primes = [1]
  (2..number).each { |n| r_primes << n unless n.gcd(number) > 1 }
  r_primes
end

def calc
  (1..1_000_000).each do |n|
    #next if n.odd?

    primes = [1,2,3]
    #primes = relatively_primes(n)
    phi = primes.size
    n_by_phi = n / phi.to_f
    #p [n, n_by_phi] if n_by_phi >= 5.1
    #p "#{n} => #{primes}, (phi) => #{phi}, (n/phi) => #{n_by_phi}"
  end
end


Benchmark.bm { |bm| bm.report { calc } }
