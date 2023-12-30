class HumanMove
  def initialize(output: $stdout, player:)
    @output = output
    @player = player
  end

  def run
    input = get_input

    # if !valid_input?(input)
    #   @output.puts 'Invalid choice.'
    #   next
    # end
  end

  private

  def get_input
    @output.puts "#{@player.name} enter a move:"

    gets.chomp
  end
end