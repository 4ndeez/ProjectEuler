require 'benchmark'
require 'prime'
# puts Benchmark.measure {
#
#   num = 600851475143
#   prime_factors = []
#   for i in 1..num
#     puts i if num % i == 0
#   end
#   puts prime_factors
# }

puts Benchmark.measure {
  puts 600851475143.prime_division.last
}

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
puts Benchmark.measure {
  puts largest_prime(600851475143)

}