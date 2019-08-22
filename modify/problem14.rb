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
    break if start_number == 500000
  end

  puts hash.key(hash.values.max)
}

puts Benchmark.measure {
  hash = Hash.new
  start_number = 999999
  counter = 0
  while true
    number = start_number
    loop do
      number = number.even? ? number/2 : number*3 + 1
      counter += 1
      break if number == 1
    end
    hash[start_number] = counter
    start_number -= 1
    break if start_number == 500000
    counter = 0
  end

  puts hash.key(hash.values.max)
}
