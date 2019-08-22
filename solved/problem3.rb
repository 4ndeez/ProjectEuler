require 'benchmark'
require 'prime'
# method 1
puts Benchmark.measure {
  puts 600851475143.prime_division.last
}

# method 2
puts Benchmark.measure {
  def largest_prime( n )
    divisor = 2

    while(true)
      while n % divisor == 0
        n /= divisor

        return divisor if n == 1
      end

      divisor += 1
    end
  end

  puts largest_prime(600851475143)
}