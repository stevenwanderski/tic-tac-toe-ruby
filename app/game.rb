require_relative './board'
require_relative './player'
require_relative './win_checker'
require_relative './input_validator'

class Game
  def initialize(output: $stdout, input: $stdin)
    @output = output
    @input = input
    @win_checker = WinChecker
    @input_validator = InputValidator

    @values = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

    @board = Board.new(output: @output)
    @player1 = Player.new(symbol: 'X')
    @player2 = Player.new(symbol: 'O')
    @active_player = @player1
  end

  def run
    @board.print(@values)

    while available_moves? do
      input = get_input

      if !valid_input?(input)
        @output.puts 'Invalid choice.'
        next
      end

      execute_move(input)

      @board.print(@values)

      if winner = get_winner
        @output.puts "#{winner.name} wins!"
        break
      elsif tie_game?
        @output.puts 'Tie game.'
        break
      end

      switch_player
    end
  end

  private

  def available_moves?
    @values.any?(' ')
  end

  def execute_move(move)
    set_value(move, @active_player.symbol)
  end

  def get_input
    @output.puts "#{@active_player.name} enter a move:"

    @input.gets.chomp
  end

  def get_winner
    if is_winner?(@player1)
      return @player1
    elsif is_winner?(@player2)
      return @player2
    end

    nil
  end

  def is_winner?(player)
    @win_checker.win?(values: @values, symbol: player.symbol)
  end

  def set_value(value, symbol)
    @values[value.to_i] = symbol
  end

  def switch_player
    @active_player = @active_player == @player1 ? @player2 : @player1
  end

  def tie_game?
    @win_checker.tie?(values: @values)
  end

  def valid_input?(input)
    @input_validator.run(input, @values)
  end
end
