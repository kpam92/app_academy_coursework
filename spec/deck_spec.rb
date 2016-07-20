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

    it "returns an array of card and removes it from all cards" do
      returned_card = deck.draw
      # expect(returned_card.is_a?(Card)).to be(true)
      expect(returned_card).to be_an_instance_of(Array)
      expect(returned_card[0]).to be_an_instance_of(Card)
      expect(deck.all_cards.length).to eq (51)
    end

    it "returns an 4 cards if you pass an argument of 4" do
      returned_card = deck.draw(4)
      # expect(returned_card.is_a?(Card)).to be(true)
      expect(returned_card).to be_an_instance_of(Array)
      expect(returned_card.length).to eq(4)
      expect(returned_card[0]).to be_an_instance_of(Card)
      expect(deck.all_cards.length).to eq (48)
    end

    it "raises an error if there are no cards left" do
      returned_card = deck.draw(52)
      expect {deck.draw}.to raise_error(ArgumentError)
    end
  end


end
