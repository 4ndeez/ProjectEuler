require 'benchmark'
require 'prime'

class Integer
  def composite?
    divisors = prime_division
    return true if divisors.length > 1

    divisors.each { |array| array.pop if array.last == 1 }.flatten.length > 1
  end

  def twice_square
    [self, 2 * self**2]
  end

  def goldbach?(squares)
    squares.reverse.each { |square| return true if (self - square[-1]).prime? }
    false
  end
end

def goldbach_conjecture
  twice_squares = [[0, 0], [1, 2], [2, 8], [3, 18]] # first 4 pre executed
  (9..Float::INFINITY).each do |i|
    next unless i.odd? && i.composite?

    twice_squares.push((twice_squares[-1][0] + 1).twice_square) if i > twice_squares[-1][-1]
    return i unless i.goldbach?(twice_squares)
  end
end

Benchmark.bmbm { |bm| bm.report { goldbach_conjecture } }
