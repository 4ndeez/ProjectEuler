require 'prime'

def validation(number)
  number.permutation(4).each do |term|
    term.reduce { |memo, i| memo.to_s << i.to_s }
    term = term.to_i
    return unless term.prime?


  end
end

(1234..9999).each do |num|
  validation(num)
end
