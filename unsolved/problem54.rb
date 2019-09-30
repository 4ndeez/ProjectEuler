require 'benchmark'

@suits = %w[Hearts Spades Clubs Diamonds]
@ranks = %w[0 1 2 3 4 5 6 7 8 9 T J Q K A]
@com

def win_decider(hands)
  count = 0 # player 1 wins
  hands.map do |h|
    combinations(h)
    break
  end
  count
end

def hand_rank # if player 1 win return true; else nil

end

def combinations(hands)
  hands = hands.split(' ')
  p1, p2 = hands[0, 5], hands[5, 5]
  r1, r2 = {}, {}
  p1.map {|p| r1[p] = @ranks.index(p[0])}
  p2.map {|p| r2[p] = @ranks.index(p[0])}
  p r1, r2
end

puts Benchmark.measure {
  hands = IO.readlines('../input/problem54.txt')
  puts win_decider(hands)
}
