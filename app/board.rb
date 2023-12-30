class Board
  attr_accessor :values

  def initialize(output: $stdout)
    @output = output
    @values = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def available_moves?
    @values.any?(' ')
  end

  def execute_move(move, symbol)
    set_value(move, symbol)
  end

  def print
    @output.puts "
      #{@values[0]} | #{@values[1]} | #{@values[2]}
      ---------
      #{@values[3]} | #{@values[4]} | #{@values[5]}
      ---------
      #{@values[6]} | #{@values[7]} | #{@values[8]}
    "
  end

  private

  def set_value(value, symbol)
    @values[value.to_i] = symbol
  end
end
