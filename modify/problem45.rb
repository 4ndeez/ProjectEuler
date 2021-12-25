require 'benchmark'

three, five, six = [], [], []
puts a = Benchmark.measure {
  (1..500).each do |i|
    three = (i * (i + 1)) / 2
    five = (i * (3 * i - 1)) / 2
    six = (i * (2 * i - 1))
    p [three, five, six]
    #three << (i * (i + 1)) / 2
    #five << (i * (3 * i - 1)) / 2
    #six << (i * (2 * i - 1))
  end
  #p three, five, six
  #three.each.with_index do |i, index|
  #puts index if (index % 1000) == 0
  # p i if five.include?(i) && six.include?(i)
  #end
  #p three, five, six
}
