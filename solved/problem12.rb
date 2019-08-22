require 'benchmark'
require 'prime'

# method 1
puts Benchmark.measure {
  def div(num)
    num.prime_division.inject(1){ |prod, n| prod *= n[1] + 1 }
  end

  hash = Hash.new
  (1..999999).map do |number|
    triangle = (1..number).reduce(:+)
    hash[triangle] = (counter = div(triangle))
    break if counter > 500
  end

  puts "#{hash.key(hash.values.max)} with #{hash.values.max}"
}

# method 2, better
puts Benchmark.measure {
  def first_triangle(max)
    (2..Float::INFINITY).inject(1) do |mem, i|
      mem += i
      return mem if mem.prime_division.map{|_, power| power+1}.reduce(&:*) >= max
      mem
    end
  end

  p first_triangle(500)
}