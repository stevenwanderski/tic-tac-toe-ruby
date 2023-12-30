class WinChecker
  def initialize(board:, player:)
    @board = board
    @player = player
  end

  def game_over?
    win? || tie?
  end

  def message
    return "Player #{@player.symbol} wins!" if win?
    return 'Tie game.' if tie?
  end

  def tie?
    !win? && !@board.available_moves?
  end

  def win?
    values = @board.values
    symbol = @player.symbol

    # Top row
    (values[0] == symbol && values[1] == symbol && values[2] == symbol) ||
    # Middle row
    (values[3] == symbol && values[4] == symbol && values[5] == symbol) ||
    # Bottom row
    (values[6] == symbol && values[7] == symbol && values[8] == symbol) ||
    # First column
    (values[0] == symbol && values[3] == symbol && values[6] == symbol) ||
    # Second column
    (values[1] == symbol && values[4] == symbol && values[7] == symbol) ||
    # Third column
    (values[2] == symbol && values[5] == symbol && values[8] == symbol) ||
    # First diagonal
    (values[0] == symbol && values[4] == symbol && values[8] == symbol) ||
    # Second diagonal
    (values[2] == symbol && values[4] == symbol && values[6] == symbol)
  end
end
