require_relative './human_move'
require_relative './computer_move'

class GameMove
  def initialize(output: $stdout, board:, player:)
    @output = output
    @board = board
    @player = player
  end

  def run
    case @player.mode
    when 'human'
      HumanMove.new(output: @output, player: @player).run
    when 'computer'
      ComputerMove.new(output: @output, player: @player, board: @board).run
    end
  end

  def self.run(**args)
    self.new(**args).run
  end
end