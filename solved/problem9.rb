require 'benchmark'
require 'prime'

puts Benchmark.measure {
  def triplet_product
    (1..1000).each do |a1|
      ((a1 + 1)..1000).each do |b1|
        c = 1000 - a1 - b1
        return a1 * b1 * c if a1**2 + b1**2 == c**2
      end
    end
  end

  puts triplet_product
}
