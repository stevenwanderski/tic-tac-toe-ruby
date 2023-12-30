require_relative './board'
require_relative './player'
require_relative './win_checker'
require_relative './input_validator'
require_relative './one_player_game'
require_relative './two_player_game'

class Game
  def initialize(
        output: $stdout,
        input: $stdin,
        one_player_game: OnePlayerGame,
        two_player_game: TwoPlayerGame,
        board: Board
  )
    @output = output
    @input = input
    @one_player_game = one_player_game
    @two_player_game = two_player_game
    @board = board.new(output: @output)
  end

  def run
    mode = get_mode

    case mode
    when '1'
      @one_player_game.run(output: @output, board: @board)
    when '2'
      @two_player_game.run(output: @output, board: @board)
    end
  end

  private

  def get_mode
    @output.puts 'Please select the game mode:'
    @output.puts '1. One Player'
    @output.puts '2. Two Players'

    mode_input = @input.gets.chomp

    case mode_input
    when '1'
      @output.puts 'One player mode selected!'
      return '1'
    when '2'
      @output.puts 'Two player mode selected!'
      return '2'
    else
      @output.puts 'Invalid input.'
      get_mode
    end
  end

  # def get_winner
  #   if is_winner?(@player1)
  #     return @player1
  #   elsif is_winner?(@player2)
  #     return @player2
  #   end

  #   nil
  # end

  # def is_winner?(player)
  #   @win_checker.win?(values: @values, symbol: player.symbol)
  # end

  # def tie_game?
  #   @win_checker.tie?(values: @values)
  # end

  # def valid_input?(input)
  #   @input_validator.run(input, @values)
  # end
end
