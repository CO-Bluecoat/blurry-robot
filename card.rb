class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
      @rank = rank
      @suit = suit
  end

  def output_card
      puts "#{self.rank} of #{self.suit}"
  end

  def self.random_card
      Card.new(rand(10), :spades)
  end

end

class Deck
  attr_accessor :cards
    def initialize
      @cards = []
      numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'jack', 'queen', 'king', 'ace']
      suites = ['hearts', 'spades', 'clubs', 'diamonds']
      numbers.each do |n|
        suites.each do |s|
          @cards << Card.new(n, s)
        end
      end
    end

    def deal
      @cards.shift
    end

    def shuffle
        @cards.shuffle!
    end

    def output
        @cards.each do |card|
            card.output_card
        end
    end
end


deck = Deck.new
deck.shuffle
deck.output