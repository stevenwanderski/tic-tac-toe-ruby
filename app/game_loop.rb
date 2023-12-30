require_relative './game_move'
require_relative './win_checker'

class GameLoop
  def initialize(output: $stdout, player1:, player2:, active_player:, board:)
    @output = output
    @board = board
    @player1 = player1
    @player2 = player2
    @active_player = active_player
    @win_checker = WinChecker
  end

  def run
    @board.print

    while @board.available_moves? do
      move = GameMove.run(output: @output, board: @board, player: @active_player)

      @board.execute_move(move, @active_player.symbol)
      @board.print

      win_checker = @win_checker.new(board: @board, player: @active_player)

      if win_checker.game_over?
        @output.puts win_checker.message
        break
      end

      switch_player
    end
  end

  private

  def switch_player
    @active_player = @active_player == @player1 ? @player2 : @player1
  end
end