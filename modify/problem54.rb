require 'benchmark'

class Hand
  SUITS = { 'S' => 'SPADES', 'H' => 'HEARTS', 'D' => 'DIAMONDS', 'C' => 'CLUBS' }.freeze
  VALUES = {
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    'T' => 10,
    'J' => 11,
    'Q' => 12,
    'K' => 13,
    'A' => 14
  }.freeze

  attr_reader :cards, :values, :suits

  def initialize(cards)
    @cards = cards
    @values = []
    @suits = []
    transform
  end

  def check
    combinations = %i[straight_flush royal_flush four_of_a_kind full_house flush straight three_of_a_kind two_pairs one_pair high_card]
    combinations.each do |sym|
      result = send(sym)
      return result if result
    end
  end

  def transform
    cards.split.each do |card|
      value, suit = card.split('')
      values << VALUES[value]
      suits << SUITS[suit]
    end
  end

  def compare(hand)
    hand1 = self.check
    hand2 = hand.check
    if hand1[0] > hand2[0]
      1
    elsif hand1[0] == hand2[0]
      hand1[1] > hand2[1] ? 1 : 2
    else
      2
    end
  end

  private

  def straight_flush
    return false unless suits.uniq.size == 1

    duplicate = values.sort
    duplicate[0..3].each.with_index do |card, index|
      return false unless duplicate[index + 1] - card == 1
    end
    [10, 1]
  end

  def royal_flush
    values.sort == [10, 11, 12, 13, 14] && suits.uniq.size == 1 ? [9, high_card[1]] : false
  end

  def four_of_a_kind
    hash = Hash.new(0)
    values.each { |card| hash[card] += 1 }
    hash.key(4) ? [8, hash.key(4)] : false
  end

  def full_house
    return false unless three_of_a_kind && one_pair

    [7, [three_of_a_kind[1], one_pair[1]]]
  end

  def flush
    suits.uniq.size == 1 ? [6, high_card[1]] : false
  end

  def straight
    duplicate = values.sort
    duplicate[0..3].each.with_index do |card, index|
      return false unless duplicate[index + 1] - card == 1
    end
    [5, high_card[1]]
  end

  def three_of_a_kind
    hash = Hash.new(0)
    values.each { |card| hash[card] += 1 }
    hash.key(3) ? [4, hash.key(3)] : false
  end

  def two_pairs
    hash = Hash.new(0)
    counter = 0
    pairs = []
    values.each { |card| hash[card] += 1 }
    hash.each_pair { |key, val| (counter += 1; pairs << key) if val == 2 }
    counter == 2 ? [3, pairs] : false
  end

  def one_pair
    hash = Hash.new(0)
    values.each { |card| hash[card] += 1 }
    hash.key(2) ? [2, hash.key(2)] : false
  end

  def high_card
    [1, values.max]
  end
end

def count_wins
  counter = 0
  IO.foreach('../input/problem54.txt') do |line|
    first = Hand.new(line[0..13])
    second = Hand.new(line[15..28])
    res = first.compare(second)
    counter += 1 if res == 1
  end
  p counter
end

Benchmark.bm { |bm| bm.report { count_wins } }
# 0.027 sec avg