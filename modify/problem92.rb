require 'benchmark'

def single_div(number)
  number.digits.map {|i| i = i**2}.sum
end

def division(number)
  num = single_div(number)
  loop do
    (@ary << number; return nil if @repeated.include?(num))
    number = single_div(number)
    if num == 89
      @ary << number
      @repeated << num
      return nil
    end
    if num == 1
      return nil
    end
  end
end

puts Benchmark.measure {
  @ary = []
  @repeated = []
  9_999_999.downto(2) { |n| division(n) }
  p @ary.size
}
