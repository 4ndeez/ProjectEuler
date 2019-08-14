require 'benchmark'
hash = { 1 => 'one',
         2 => 'two',
         3 => 'three',
         4 => 'four',
         5 => 'five',
         6 => 'six',
         7 => 'seven',
         8 => 'eight',
         9 => 'nine',
         10 => 'ten',
         11 => 'eleven',
         12 => 'twelve',
         13 => 'thirteen',
         14 => 'fourteen',
         15 => 'fifteen',
         16 => 'sixteen',
         17 => 'seventeen',
         18 => 'eighteen',
         19 => 'nineteen',
         20 => 'twenty',
         30 => 'thirty',
         40 => 'forty',
         50 => 'fifty',
         60 => 'sixty',
         70 => 'seventy',
         80 => 'eighty',
         90 => 'ninety',
         100 => 'hundred',
         1000 => 'thousand' }
word_array = Array.new

def translator(number, hash, reminder = 0, output = '')
  reminder = number % 10
  if !hash[number].nil? && number < 100
    return hash[number]
  end
  if number/100 != 0 # 100+
    if number == 1000
      return "onethousand"
    end
    reminder = number % 100
    output = hash[number/100] + hash[100]
    if reminder != 0
      return output += 'and' + translator(reminder, hash)
    else
      return output
    end
  end
  if reminder != 0 # 21..99
    return output = (hash[number - reminder] + hash[reminder])
  end
  output
end

puts Benchmark.measure {
  (1..1000).map do |num|
    word_array << translator(num, hash)
  end

  puts word_array.reduce(:+).chars.length
}
