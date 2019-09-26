require 'benchmark'

puts Benchmark.measure {
  result_ary = []
  check = {}
  (1..4999).map do |i|
    (1..99).map do |j|
      res = (i * j).to_s
      out = (res + i.to_s + j.to_s)
      if !out.include?("0") && out.match(/^(?!.*(.).*\1)\d{9}$/)
        result_ary << res
        check[res] = [i, j]
      end
    end
  end
  p check
  p result_ary.map(&:to_i).uniq.sum
}

puts Benchmark.measure {
  puts (1..4999).flat_map { |a|
    (1..99).map do |b|
      [a.to_s + b.to_s + (a*b).to_s, a*b]
    end
  }.select { |p|
    p[0].length == 9 && p[0].each_char.sort.join == "123456789"
  }.map { |p| p[1] }.uniq.reduce(:+)
}
