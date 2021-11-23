require 'benchmark'

def divide(n, d, repo = [])
  return repo.size - repo.index(n) if repo.include? n
  divide 10 * (n - (n / d) * d), d, repo << n
end

highest = { 'd' => 1, 'count' => 1 }
(1..499).each do |i|
  x = i * 2 + 1
  count = divide(1, x)
  highest = { 'd' => x, 'count' => count } if count > highest['count']
end

# _____________
# second solution
def reciprocal_cycle
  max, num = 0, 0
  (1..999).each do |i|
    len = /(\w+?)\1/.match(((10**2000) / i).to_s)[1].length
    max, num = len, i if len > max
  end
  [max, num]
end

Benchmark.bm { |bm| bm.report { reciprocal_cycle } }
