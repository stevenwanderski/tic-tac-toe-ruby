require_relative '../app/game'

describe Game do
  describe '#run' do
    let(:test_output) { StringIO.new }
    let(:test_input) { StringIO.new }
    let(:game) { Game.new(output: test_output, input: test_input) }

    subject { game.run }

    it 'shows player1 as the winner' do
      allow(test_input).to receive(:gets).and_return('0', '3', '1', '4', '2')

      subject

      expect(test_output.string).to include('Drusas wins')
    end

    it 'shows player2 as the winner' do
      allow(test_input).to receive(:gets).and_return('0', '3', '1', '4', '6', '5')

      subject

      expect(test_output.string).to include('Kellhus wins')
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