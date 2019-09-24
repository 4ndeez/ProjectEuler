require 'benchmark'
#
tree = [[75],
        [95, 64],
        [17, 47, 82],
        [18, 35, 87, 10],
        [20, 4, 82, 47, 65],
        [19, 1, 23, 75, 3, 34],
        [88, 2, 77, 73, 7, 63, 67],
        [99, 65, 4, 28, 6, 16, 70, 92],
        [41, 41, 26, 56, 83, 40, 80, 70, 33],
        [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
        [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
        [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
        [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
        [63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
        [4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]]
# paths = [[0, 0]]
# sum = 0
#
# puts Benchmark.measure {
#   loop do
#     pointer = paths.pop
#     i, j = pointer[0], pointer[1]
#     if i < tree.size
#       paths.include?([i + 1, j]) ? (paths << [i + 1, j + 1]; sum += tree[i+1][j+1]) : (paths << [i + 1, j]; sum += tree[i+1][j])
#     end
#   end
# }

puts Benchmark.measure {
  input = "75
  95 64
  17 47 82
  18 35 87 10
  20 04 82 47 65
  19 01 23 75 03 34
  88 02 77 73 07 63 67
  99 65 04 28 06 16 70 92
  41 41 26 56 83 40 80 70 33
  41 48 72 33 47 32 37 16 94 29
  53 71 44 65 25 43 91 52 97 51 14
  70 11 33 28 77 73 17 78 39 68 17 57
  91 71 52 38 17 14 91 43 58 50 27 29 48
  63 66 04 68 89 53 67 30 73 16 69 87 40 31
  04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

      tree = []
  cache = []

  input.split("n").each do |row|
    tree << []
    cache << []
    row.split("s").each do |i|
      tree.last << i.to_i
    end
  end

  def sum tree, cache, row, index, total

    if tree[row] == nil or tree[row][index] == nil
      return 0
    end

    if cache[row][index] != nil
      return total += cache[row][index]
    end

    left  = sum( tree, cache, row + 1, index, total )
    right = sum( tree, cache, row + 1, index + 1, total )

    cache[row][index] = [left, right].max + tree[row][index]

  end

  puts sum( tree, cache, 0, 0, 0 )
}

puts Benchmark.measure {
  triangle_str = <<EOS
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
EOS

  triangle = triangle_str.each_line.map { |line| line.split.map(&:to_i) }

  (triangle.length - 2).downto(0) do |y|
    triangle[y].length.times do |x|
      triangle[y][x] += [triangle[y+1][x], triangle[y+1][x+1]].max
    end
  end

  puts triangle[0][0]
}