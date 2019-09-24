require 'benchmark'
puts Benchmark.measure {
  paths = [[0, 1], [1, 0]]
  counter = 0
  loop do
    pointer = paths.pop
    x, y = pointer[0], pointer[1]
    if pointer[0] < 11
      paths << [x + 1, y] unless paths.include?([x + 1, y])
    end

    if pointer[1] < 11
      paths << [x, y + 1] unless paths.include?([x, y + 1])
    end
    # p pointer
    counter += 1 if x + y == 22
    break if paths.empty?
  end
  p counter
}

puts Benchmark.measure {
  def move grid, x, y
    size = grid.size - 1
    if x > size or y > size
      return 0
    end
    if x == size and y == size
      return 1
    end
    if grid[x][y] != nil
      return grid[x][y]
    end

    grid[x][y] = move(grid, x + 1, y) + move(grid, x, y + 1)
  end

  size = ARGV[0].to_i
  grid = Array.new(size + 1) do |i|
    i = Array.new(size + 1)
  end

  puts move(grid, 0, 0)
}

puts Benchmark.measure {
  class Integer
    def choose(k)
      (self-k+1 .. self).inject(1, &:*) / (2 .. k).inject(1, &:*)
    end
  end

  puts 40.choose(20)
}