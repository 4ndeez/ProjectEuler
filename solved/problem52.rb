require 'benchmark'

class Integer
  def six_times_equal?
    (2..6).each { |x| return false unless digits.sort == (self * x).digits.sort }
    true
  end
end

def init
  (100_000..200_000).each { |number| return number if number.six_times_equal? }
end

Benchmark.bm { |bm| bm.report { init } }
# 0.07 sec avg
