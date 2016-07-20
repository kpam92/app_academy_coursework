require 'card'

class Hand
  attr_reader :cards
  def initialize(array)
    @cards = array
  end


  def high_card
    max = @cards[0]
    @cards.each do |el|
      if el.value > max.value
        max = el
      elsif el.value == max
        max = el if suit_trumps?(max, el)
      end
    end
    max
  end



  def two_of_a_kind?
    values = @cards.map{|card| card.value}
    values.any?{|val| values.count(val) == 2}
  end

  def three_of_a_kind?
    values.any?{|val| values.count(val) == 3}
  end

  def full_house?
    two_of_a_kind? && three_of_a_kind?
  end

  def four_of_a_kind?
    values.any?{|val| values.count(val) == 4}
  end

  def two_pair?
    return false unless two_of_a_kind?
    return false if three_of_a_kind?
    values.uniq.length == 3
  end

  def flush?
    suits.uniq.length == 1
  end

  def straight?
    id = 0
    all_values = values.sort
    all_values.sort.each_with_index do |val, idx|
      break if idx == all_values.length - 2
      next if val == 1 && all_values[idx+1] == 10

      if val < 13
        return false unless all_values[idx+1] - val == 1
      else
        return false unless all_values[0] == 1
      end
    end
    true
  end
  private

  def values
    @cards.map{|card| card.value}
  end

  def suits
    @cards.map {|x| x.suit }
  end
  def suit_trumps(current_max, other_card)
    suits = ["Spades", "Hearts", "Diamonds", "Clubs"]
    suits.each do |suit|
      return false if current_max.suit == suit
      return true if other_card.suit == suit
    end
  end
end
