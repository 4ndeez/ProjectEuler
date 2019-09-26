require 'benchmark'

puts Benchmark.measure {
  def divide n, d, repo = []
    return repo.size - repo.index(n) if repo.include? n
    divide 10 * (n - (n / d) * d), d, repo << n
  end

  highest = {"d" => 1, "count" => 1}

  (1..499).each do |i|
    x     = i * 2 + 1
    count = divide 1, x
    if count > highest['count']
      highest = {"d" => x, "count" => count}
    end
  end

  puts highest
  puts highest["d"]
}

puts Benchmark.measure {
  max,num=0,0
  1.upto(999) do |i|
    len=/(\w+?)\1/.match(((10**2000)/i).to_s)[1].length
    max,num=len,i if len > max
  end
  puts num
  puts max
}
