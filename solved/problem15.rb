require 'benchmark'

class Integer
  def choose(k)
    (self-k+1 .. self).inject(1, &:*) / (2 .. k).inject(1, &:*)
  end
end

puts Benchmark.measure{ puts 40.choose(20) }
