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
  result_ary = []
  check = {}
  (1..4999).map do |i|
    (1..99).map do |j|
      res = (i * j).to_s
      out = (res + i.to_s + j.to_s)
      next if out.include?('0') || out.chars.size != 9
      if out.chars.uniq.count == 9
        result_ary << res
        check[res] = [i, j]
      end
    end
  end
  p check
  p result_ary.map(&:to_i).uniq.sum
}
