require 'benchmark'
$hash = { 1 => 'one',
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
         1000 => 'onethousand' }
word_array = Array.new

def translator(number)
  reminder = number >= 100 ? number % 100 : number % 10
  case number
  when 1..99
    return $hash[number] unless $hash[number].nil? && number # return hash if exist
    ($hash[number-reminder] + $hash[reminder])
  when 100...1000
    return ($hash[number/100] + $hash[100]) if reminder == 0
    if !$hash[reminder].nil?
      ($hash[number/100] + $hash[100] + 'and' + $hash[reminder])
    else
      rem = number % 10
      ($hash[number/100] + $hash[100] + 'and' + $hash[reminder - rem] + $hash[rem])
    end
  else
    $hash[number] # 1000
  end
end

puts Benchmark.measure {
  (1..1000).map do |num|
    word_array << translator(num)
  end

  puts word_array.reduce(:+).chars.length
}
