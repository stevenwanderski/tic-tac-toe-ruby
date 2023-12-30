require_relative '../app/game'

describe Game do
  describe '#run' do
    let(:test_output) { StringIO.new }
    let(:test_input) { StringIO.new }
    let(:game) { Game.new(output: test_output, input: test_input) }

    subject { game.run }

    it 'starts a one player game' do
      allow(test_input).to receive(:gets).and_return('1')

      subject

      expect(test_output.string).to include('One player mode selected!')
    end

    it 'starts a two player game' do
      allow(test_input).to receive(:gets).and_return('2')

      subject

      expect(test_output.string).to include('Two player mode selected!')
    end

    it 'handles invalid input' do
      allow(test_input).to receive(:gets).and_return('a', '1')

      subject

      expect(test_output.string).to include('Invalid input.')
    end

    # it 'shows player1 as the winner' do
    #   values = [' ', ' ', 'X', ' ']

    #   puts values.each_index.select { |i| values[i] == ' ' }.sample


    #   allow(test_input).to receive(:gets).and_return('2', '0', '1', '2', '3', '4', '5', '7', '6', '8')

    #   subject

    #   expect(test_output.string).to include('Player X wins')
    #   expect(test_output.string).to_not include('Tie game')
    # end

    # it 'shows player2 as the winner' do
    #   allow(test_input).to receive(:gets).and_return('2', '0', '3', '1', '4', '6', '5')

    #   subject

    #   expect(test_output.string).to include('Player O wins')
    # end

    # it 'shows a tie game' do
    #   allow(test_input).to receive(:gets).and_return('2', '0', '3', '1', '4', '5', '2', '6', '7', '8')

    #   subject

    #   expect(test_output.string).to include('Tie game')
    #   expect(test_output.string).to_not include('wins')
    # end

    # it 'handles invalid input' do
    #   allow(test_input).to receive(:gets).and_return('2', '9', '0', '3', '1', '4', '2')

    #   subject

    #   expect(test_output.string).to include('Invalid choice')
    # end

    # it 'handles unavailable input' do
    #   allow(test_input).to receive(:gets).and_return('2', '0', '3', '0', '1', '4', '2')

    #   subject

    #   expect(test_output.string).to include('Invalid choice')
    # end
  end
end