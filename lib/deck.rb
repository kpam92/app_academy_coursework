require_relative "card"


class Deck
  attr_reader :all_cards
  def initialize
    @all_cards = []
    populate_cards
    shuffle!
  end

  def populate_cards
    ["Spades", "Clubs", "Hearts", "Diamonds"].each do |suit|
      (1..13).each do |value|
        @all_cards << Card.new(value, suit)
      end
    end
  end

  def shuffle!
    @all_cards = @all_cards.shuffle
  end

end
