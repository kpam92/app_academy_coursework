require 'card'
class Hand
  attr_reader :cards
  def initialize(array)
    @cards = array
  end

  HAND_RANKING = ["straight flush", "four of a kind", "full house", "flush", "straight", "three of a kind", "two pair", "one pair", "high card"]
  def score
    score_hash = {
      "straight flush" => self.straight_flush?,
      "four of a kind" => self.four_of_a_kind?,
      "full house" => self.full_house?,
      "flush" => self.flush?,
      "straight" => self.straight?,
      "three of a kind" => self.three_of_a_kind?,
      "two pair" => self.two_pair?,
      "one pair" => self.two_of_a_kind?,
      "high card" => self.high_card
    }
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

  def compare_high_card(other_hand)
    self_high_card = self.high_card
    other_high_card = other_hand.high_card
    if self_high_card.value > other_high_card.value
      return "Current hand wins"
    elsif other_high_card.value > self_high_card.value
      return "Other hand wins"
    else
      return "Current hand wins" unless suit_trumps(self_high_card, other_high_card)
    end
    return "Other hand wins"
  end

  def compare_hand(other_hand)
    other_hand_score = other_hand.score
    our_score = self.score
    HAND_RANKING.each do |key|
      if our_score[key] && !other_hand_score[key]
        return "Current hand wins"
      elsif !our_score[key] && other_hand_score[key]
        return "Other hand wins"
      elsif our_score[key] && other_hand_score[key]
        return tie_breaker(other_hand,key)
      end
    end
  end

  def tie_breaker(other_hand, key)
    if key == "straight_flush"
      compare_straight_flush(other_hand)
    elsif key == "four of a kind"
      compare_four_of_a_kind(other_hand)
    elsif key == "full house"
      compare_full_house(other_hand)
    elsif key == "flush"
      compare_flush(other_hand)
    elsif key == "straight"
      compare_straight(other_hand)
    elsif key == "three of a kind"
      compare_three_of_kind(other_hand)
    elsif key == "two pair"
      compare_two_pair(other_hand)
    elsif key == "one pair"
      compare_one_pair(other_hand)
    elsif key == "high card"
      compare_high_card(other_hand)
    end
    # return "Current hand wins" if njnlkasnjksad
    # return "Other hand wins" if sf;ls;a #return true if we win against other hand
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

  def straight_flush?
    flush? && straight?
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
