require_relative '../app/game'

describe Game do
  describe '#run' do
    let(:test_output) { StringIO.new }
    let(:test_input) { StringIO.new }
    let(:game) { Game.new(output: test_output, input: test_input) }

    subject { game.run }

    it 'shows player1 as the winner' do
      allow(test_input).to receive(:gets).and_return('0', '1', '2', '3', '4', '5', '7', '6', '8')

      subject

      expect(test_output.string).to include('Player X wins')
      expect(test_output.string).to_not include('Tie game')
    end

    it 'shows player2 as the winner' do
      allow(test_input).to receive(:gets).and_return('0', '3', '1', '4', '6', '5')

      subject

      expect(test_output.string).to include('Player O wins')
    end

    it 'shows a tie game' do
      allow(test_input).to receive(:gets).and_return('0', '3', '1', '4', '5', '2', '6', '7', '8')

      subject

      expect(test_output.string).to include('Tie game')
      expect(test_output.string).to_not include('wins')
    end

    it 'handles invalid input' do
      allow(test_input).to receive(:gets).and_return('9', '0', '3', '1', '4', '2')

      subject

      expect(test_output.string).to include('Invalid choice')
    end

    it 'handles unavailable input' do
      allow(test_input).to receive(:gets).and_return('0', '3', '0', '1', '4', '2')

      subject

      expect(test_output.string).to include('Invalid choice')
    end
  end
end