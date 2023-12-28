class Player
  attr_accessor :symbol

  def initialize(symbol:)
    @symbol = symbol
  end

  def name
    "Player #{symbol}"
  end
end
