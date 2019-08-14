require 'benchmark'
puts Benchmark.measure {
  hash = Hash.new
  start_number = 999999

  def function(number, counter)
    number = number.even? ? number/2 : number*3 + 1
    counter += 1
    if number > 1
      function(number, counter)
    else
      return counter
    end
  end

  while true
    hash[start_number] = function(start_number, 0)
    start_number -= 1
    puts start_number
    break if start_number == 500000
  end

  puts hash.key(hash.values.max)

}
