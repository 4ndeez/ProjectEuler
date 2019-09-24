require 'benchmark'

def digit_powers(n)
  sum = 0

end

puts Benchmark.measure {
  sum = 0
  (1111..200000).map do |n|
    (sum += n; puts n) if n == n.digits.map {|x| x = x**5}.sum
  end
  p sum
}

puts Benchmark.measure {
  list = []
  2.upto 1_000_000 do |i|
    list << i if i==i.to_s.split(//).inject(0) {|sum,j| sum + j.to_i**5}
  end
  puts list.inject {|sum,i| sum+i}
}

puts Benchmark.measure {
  @sum = 0
  (2..9**5*6).each { |i|
    sum = 0
    i.to_s.split('').each { |digit| sum += digit.to_i**5 }
    @sum += sum if i == sum
  }
  p @sum
}

puts Benchmark.measure {
  puts (2..354294).select{|n|n==n.to_s.split(//).inject(0){|s,i|s+i.to_i**5}}.inject(0){|sum,i|sum+i}
}

puts Benchmark.measure {
  $ok = []
  def prob(*args)
    prod = args.inject(0) {|r,i| r+i**5}
    return if $ok.include? prod
    $ok << prod if args.sort == prod.to_s.split(//).map{|i| i.to_i}.sort
  end
  (0..9).each do |a|
    (a..9).each do |b|
      prob(a,b)
      (b..9).each do |c|
        prob(a,b,c)
        (c..9).each do |d|
          prob(a,b,c,d)
          (d..9).each do |e|
            prob(a,b,c,d,e)
            (e..9).each do |f|
              prob(a,b,c,d,e,f)
            end
          end
        end
      end
    end
  end
  p $ok.inject(0) {|r,i|r+i}
}