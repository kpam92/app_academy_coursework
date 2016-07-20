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

  def suit_trumps(current_max, other_card)
    suits = ["Spades", "Hearts", "Diamonds", "Clubs"]
    suits.each do |suit|
      return false if current_max.suit == suit
      return true if other_card.suit == suit
    end
  end

end
