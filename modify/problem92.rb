require 'benchmark'

def single_div(number)
  number.digits.map {|i| i = i**2}.sum
end

def division(number)
  original_num = number
  remainders = []
  hash = {}
  until number == 89 || number == 1
    number = single_div(number)
    remainders << number
    if @hash.values[0].include?(number)
      number = 1
      break
    elsif @hash.values[1].include?(number)
      number = 89
      break
    end
  end
  number == 89 ? hash[89] = remainders : hash[1] = remainders
  [hash, original_num]
end

puts Benchmark.measure {
  count = 0
  @hash = { 1 => [], 89 => [] }
  99_999.downto(2) do |num|
    result = division(num)
    @hash[result[0].keys[0]] += result[0].values.flatten
    @hash[1] = @hash.values[0].uniq
    @hash[89] = @hash.values[1].uniq
    count = count + 1 if result[0].keys[0] == 89
  end
  p @hash.values.flatten.size
  p count
}

# method returning hash or value
# == with hash keys (uniq)
