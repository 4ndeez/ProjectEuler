require 'benchmark'

class Integer
  def lychrel?
    original = self
    50.times do |i|
      reversed = original.to_s.reverse.to_i
      return false if original == reversed && i != 0

      original += reversed
    end
    true
  end
end

def run_solution(from, to)
  counter = 0
  (from..to).each { |i| counter += 1 if i.lychrel? }
  counter
end

Benchmark.bm { |bm| bm.report { run_solution(1, 10_000) } }
# 0.02 sec avg
