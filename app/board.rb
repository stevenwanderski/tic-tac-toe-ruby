class Board
  def initialize(output: $stdout)
    @output = output
  end

  def print(values)
    @output.puts "
      #{values[0]} | #{values[1]} | #{values[2]}
      ---------
      #{values[3]} | #{values[4]} | #{values[5]}
      ---------
      #{values[6]} | #{values[7]} | #{values[8]}
    "
  end
end
