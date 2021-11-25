require 'benchmark'
require 'prime'

class Integer
  def prime_permutation
    digits.permutation(4).select { |perm| perm.join.to_i.prime? && perm.join.to_i > 1000 }.uniq.map { |i| i.join.to_i }
  end
end

def find_sequence(array)
  return false if array.include?(1487) # skipping another existing sequence

  array.each do |a|
    array.each do |b|
      difference = b - a
      array.each do |c|
        return [a, b, c].sort.join if c - b == difference && difference != 0
      end
    end
  end
  false
end

def init
  (1000..9999).each do |number|
    next unless number.prime?

    permutations = number.prime_permutation
    next if permutations.length < 3
    break if find_sequence(permutations.sort)
  end
end

Benchmark.bmbm { |bm| bm.report { init } }
# 0.025 sec avg
