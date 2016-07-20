require 'rspec'
require 'hand'

describe Hand do
  # let(:cards) {double('card', :value => 1 }
  let(:cards) {[
          Card.new(2, "Hearts"),
          Card.new(3, "Hearts"),
          Card.new(10, "Spades"),
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
      expect(hand.high_card.value).to eq(10)
    end

    it "chooses the higher suited card" do
      high_card_hand = Hand.new(cards2).high_card
      expect(high_card_hand.value).to eq(7)
      expect(high_card_hand.suit).to eq("Spades")
    end
  end
  let(:cards3) {[
          Card.new(2, "Hearts"),
          Card.new(2, "Spades"),
          Card.new(3, "Spades"),
          Card.new(3, "Diamonds"),
          Card.new(3, "Hearts")
    ]
  }

  describe "#two of a kind" do

    it "returns true if there is 1 pair" do
      expect(Hand.new(cards3).two_of_a_kind?).to be(true)
    end
    it "returns false if there is no 1 pair" do
      expect(Hand.new(cards).two_of_a_kind?).to be(false)
    end

  end

  describe "#three of a kind" do

    it "returns true if there are 3 of a kind" do
      expect(Hand.new(cards3).three_of_a_kind?).to be(true)
    end
    it "returns false if there are no 3 of a kind" do
      expect(Hand.new(cards).three_of_a_kind?).to be(false)
    end

  end

  describe "#full_house" do

    it "returns true if there is a full house" do
      expect(Hand.new(cards3).full_house?).to be(true)
    end
    it "returns false if there is no full_house" do
      expect(Hand.new(cards).full_house?).to be(false)
    end

  end


  let(:cards4) {[
          Card.new(2, "Hearts"),
          Card.new(3, "Clubs"),
          Card.new(3, "Spades"),
          Card.new(3, "Diamonds"),
          Card.new(3, "Hearts")
    ]
  }

  describe "#four of a kind" do

    it "returns false for 1 pair" do
      expect(Hand.new(cards4).two_of_a_kind?).to be(false)
    end
    it "returns false if there is no 4 of a kind" do
      expect(Hand.new(cards).four_of_a_kind?).to be(false)
    end
    it "returns true if there is 4 of a kind" do
      expect(Hand.new(cards4).four_of_a_kind?).to be(true)
    end
  end

  let(:cards5) {[
          Card.new(2, "Hearts"),
          Card.new(3, "Hearts"),
          Card.new(2, "Hearts"),
          Card.new(3, "Hearts"),
          Card.new(5, "Hearts")
    ]
  }

  describe "#two pair" do

    it "returns true for 1 pair" do
      expect(Hand.new(cards5).two_of_a_kind?).to be(true)
    end
    it "returns false if there is no 3 of a kind" do
      expect(Hand.new(cards5).three_of_a_kind?).to be(false)
    end
    it "returns true for two pairs" do
      expect(Hand.new(cards5).two_pair?).to be(true)
    end
  end

  describe "#flush" do

    it "returns true if cards are all of the same suit" do
      expect(Hand.new(cards5).flush?).to be(true)
    end

    it "returns false if cards are not all of the same suit" do
      expect(Hand.new(cards4).flush?).to be(false)
    end

  end

  let(:cards6) {[
          Card.new(10, "Hearts"),
          Card.new(11, "Hearts"),
          Card.new(12, "Hearts"),
          Card.new(13, "Hearts"),
          Card.new(1, "Hearts")
    ]
  }
  let(:cards7) {[
          Card.new(1, "Hearts"),
          Card.new(2, "Hearts"),
          Card.new(3, "Hearts"),
          Card.new(4, "Hearts"),
          Card.new(5, "Hearts")
    ]
  }

  let(:cards8) {[
          Card.new(6, "Hearts"),
          Card.new(8, "Hearts"),
          Card.new(4, "Hearts"),
          Card.new(5, "Hearts"),
          Card.new(7, "Hearts")
    ]
  }

  describe "#straight" do

    it "returns true if all cards are straight" do
      expect(Hand.new(cards8).straight?).to be(true)
    end

    it "handles ace correctly" do
      expect(Hand.new(cards6).straight?).to be(true)
    end

    it "handles ace correctly" do
      expect(Hand.new(cards7).straight?).to be(true)
    end


    it "returns false if cards are not in a straight" do
      expect(Hand.new(cards4).straight?).to be(false)
    end

  end

end
