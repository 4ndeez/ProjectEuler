require 'benchmark'
$ary = []
def fraction(numerator)
  (numerator..99).each do |denominator|
    next if numerator > denominator || denominator == numerator || ((numerator % 10).zero? && (denominator % 10).zero?)

    cancel_number(numerator, denominator)
  end
end

def cancel_number(num, denom)
  (0..1).each do |i|
    (0..1).each do |j|

      next if
      $ary << [num, denom] if (num.to_s[i].to_f / denom.to_s[j].to_f == num.to_f / denom) && num.to_s[i]
    end
  end
end

puts Benchmark.measure {
  (numerator..99).each do |i|
    fraction i
  end
}

p $ary