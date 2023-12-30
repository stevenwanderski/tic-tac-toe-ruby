require_relative './board'
require_relative './player'
require_relative './game_loop'

class OnePlayerGame
  def initialize(output: $stdout, board:, player: Player, game_loop: GameLoop)
    @output = output
    @board = board
    @game_loop = game_loop
    @player1 = player.new(symbol: 'X', mode: 'human')
    @player2 = player.new(symbol: 'O', mode: 'computer')
  end

  def run
    @game_loop.new(
      output: @output,
      player1: @player1,
      player2: @player2,
      active_player: @player1,
      board: @board
    ).run
  end

  def self.run(**args)
    self.new(**args).run
  end
end