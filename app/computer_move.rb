class ComputerMove
  def initialize(output: $stdout, board:, player:)
    @output = output
    @board = board
    @player = player
  end

  def run
    values = @board.values
    input = values.each_index.select { |i| values[i] == ' ' }.sample
  end
end