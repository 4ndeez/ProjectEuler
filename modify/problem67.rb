require 'benchmark'

def max_path(ary)
  (ary.length - 2).downto(0) do |y|
    ary[y].length.times do |x|
      ary[y][x] += [ary[y+1][x], ary[y+1][x+1]].max
    end
  end
  ary[0][0]
end

puts Benchmark.measure {
  triangle = File.read('../input/problem67.txt').each_line.map { |line| line.split.map(&:to_i) }
  puts max_path(triangle)
}
