require 'benchmark'

puts Benchmark.measure {
  (0..9).to_a.permutation(9).with_index {|n, i| (p n.join; break) if i == 999999}
}

puts Benchmark.measure {
  class Integer
    def factorial
      (2..self).inject(1) { |p, x| p * x }
    end
  end

  index = 1_000_000 - 1
  n = 0
  n += 1 while (n+1).factorial < index

  factoradic =
      (0..n).to_a.reverse.inject([index]) { |r, x|
        r += r.pop.divmod x.factorial
      }[0..-2]

  elements = (0..9).to_a
  p factoradic.map { |e| elements.delete_at e }.join("")
}
