require 'benchmark'

def canceling_digit?(n, d)
  num = n.digits.reverse
  denom = d.digits.reverse
  return false if num == denom || num[0] == num[1] || denom[0] == denom[1] || (n % 10).zero? || (d % 10).zero?

  num.each.with_index do |i, i_index|
    denom.each.with_index do |j, j_index|
      return true if i / j.to_f == n / d.to_f && num[i_index - 1] == denom[j_index - 1]
    end
  end
  false
end

def init
  result = 1
  (10..99).each { |denom| (10..denom).each { |num| result *= denom if canceling_digit?(num, denom) } }
  result
end

Benchmark.bm { |bm| bm.report { init } }
# 0.008 sec avg
