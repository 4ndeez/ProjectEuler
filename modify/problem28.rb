require 'benchmark'

def diagonals_sum(n)
  offset, sum, pointer, counter = 2, 0, 1, 0
  while pointer <= n * n
    sum += pointer
    if counter % 4 == 0 && counter > 3
      offset += 2
      pointer += offset
    else
      pointer += offset
    end
    counter += 1
  end
  sum
end

puts Benchmark.measure {
  p diagonals_sum(1001)
}

puts Benchmark.measure {
  def clockwise_matrix(n)
    (1..n*n).each_slice(n).map do |i|
      p i
    end
  end

  clockwise_matrix 5
}