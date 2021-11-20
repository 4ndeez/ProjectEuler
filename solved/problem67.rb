require 'benchmark'

def max_path
  ary = File.read('../input/problem67.txt').each_line.map { |line| line.split.map(&:to_i) }
  (ary.length - 2).downto(0) { |y| ary[y].length.times { |x| ary[y][x] += [ary[y + 1][x], ary[y + 1][x + 1]].max } }
  ary[0][0]
end

Benchmark.bm { |bm| bm.report { max_path } }
