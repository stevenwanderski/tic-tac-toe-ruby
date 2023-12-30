class Player
  attr_accessor :symbol, :mode

  def initialize(symbol:, mode:)
    @symbol = symbol
    @mode = mode
  end

  def name
    "Player #{symbol}"
  end
end
