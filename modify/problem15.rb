require 'benchmark'
puts Benchmark.measure {
  paths = [[0, 1], [1, 0]]
  counter = 0
  loop do
    pointer = paths.pop
    x, y = pointer[0], pointer[1]
    if pointer[0] < 12
      paths << [x + 1, y] unless paths.include?([x + 1, y])
    end

    if pointer[1] < 12
      paths << [x, y + 1] unless paths.include?([x, y + 1])
    end
    # p pointer
    counter += 1 if x+y == 24
    break if paths.empty?
  end
  p counter
}
