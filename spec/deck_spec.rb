require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) {Deck.new}
  describe "#initialize" do
    it "builds a deck of 52 cards" do
      expect(deck.all_cards.length).to eq (52)
    end

    it "each card is a card object" do
      expect(deck.all_cards.all?{|el| el.is_a?(Card)}).to eq(true)
    end

    it "creates a deck with 13 spades, 13 clubs, 13 hearts, and 13 diamonds" do
      cards = deck.all_cards
      evaluate =["Spades","Hearts","Diamonds","Clubs"].all? do |suit|
        cards.select{|el| el.suit == suit}.length == 13
      end
      expect(evaluate).to be(true)
    end

  end

  describe "#shuffle!" do
    it "shuffles the deck" do
      current_cards = deck.all_cards.clone
      expect(deck.shuffle!).to_not eq(current_cards)
      # expect(deck.shuffle.sort).to be(current_cards.sort)
    end
  end

  describe "#draw" do

  end


end
