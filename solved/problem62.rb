require 'benchmark'

def print_cubic_permutations(length)
  hash = Hash.new { |key, value| key[value] = [] }

  (1..Float::INFINITY).each do |number|
    number_cube = (number**3).digits.sort.join
    hash[number_cube] << number
    return hash[number_cube].first**3 if hash[number_cube].size == length
  end
end

Benchmark.bm { |bm| bm.report { p print_cubic_permutations(5) } }
# 0.04 sec avg
