require 'benchmark'

def longest_chain(number, counter = 0)
  number, counter = number.even? ? number/2 : (number*3) + 1, counter + 1
  return counter + @hash[number] if @hash[number]
  number > 1 ? longest_chain(number, counter) : counter
end

puts Benchmark.measure {
  @hash = {}
  (1...1_000_000).each {|n| n.odd? ? @hash[n] = longest_chain(n) : next}
  p @hash.key(@hash.values.max)
}
