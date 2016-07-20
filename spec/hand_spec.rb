require 'rspec'
require 'hand'

describe Hand do
  # let(:cards) {double('card', :value => 1 }
  let(:cards) {[
          Card.new(2, "Hearts"),
          Card.new(3, "Hearts"),
          Card.new(7, "Spades"),
          Card.new(9, "Diamonds"),
          Card.new(7, "Hearts")
    ]
  }
  let(:hand) {Hand.new(cards)}
  describe "#initialize" do

    it "requires an input of cards in an array" do
      expect{ Hand.new}.to raise_error(ArgumentError)
      expect{ Hand.new([])}.to_not raise_error
    end
  end

  describe "#high_card" do
    let(:cards2) {[
            Card.new(2, "Hearts"),
            Card.new(3, "Hearts"),
            Card.new(7, "Spades"),
            Card.new(3, "Diamonds"),
            Card.new(7, "Hearts")
      ]
    }
    it "gives the high card" do
      expect(hand.high_card.value).to eq(9)
    end

    it "chooses the higher suited card" do
      high_card_hand = Hand.new(cards2).high_card
      expect(high_card_hand.value).to eq(7)
      expect(high_card_hand.suit).to eq("Spades")
    end
  end

end
