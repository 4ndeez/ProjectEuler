require 'benchmark'

puts Benchmark.measure {
  offset = 2
  ary = (1..1002001).to_a
  sum = 0
  pointer = 0
  inner = 1
  counter = 0
  while pointer < ary.size
    sum += ary[pointer]
    counter += 1
    if (counter-1) % 4 == 0 && counter > 3
      offset += 2
      pointer += offset
      inner += 1
    else
      pointer += offset
    end
  end
  p sum
}
