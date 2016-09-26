require 'rspec'
require 'card'

describe Card do
  describe "#initialize" do
    let(:card) {Card.new(5,"Spades")}
    it "sets the value of the card" do
      expect(card.value).to eq(5)
    end

    it "sets the suit of the card" do
      expect(card.suit).to eq("Spades")
    end
  end


end
