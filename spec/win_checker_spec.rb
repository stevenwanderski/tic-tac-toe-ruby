require_relative '../app/win_checker'

describe WinChecker do
  describe '.win?' do
    it 'returns true' do
      expect(WinChecker.win?(values: ['X', 'X', 'X', '', '', '', '', '', ''], symbol: 'X')).to eq(true)
      expect(WinChecker.win?(values: ['', '', '', 'X', 'X', 'X', '', '', ''], symbol: 'X')).to eq(true)
      expect(WinChecker.win?(values: ['', '', '', '', '', '', 'X', 'X', 'X'], symbol: 'X')).to eq(true)
      expect(WinChecker.win?(values: ['X', '', '', 'X', '', '', 'X', '', ''], symbol: 'X')).to eq(true)
      expect(WinChecker.win?(values: ['', 'X', '', '', 'X', '', '', 'X', ''], symbol: 'X')).to eq(true)
      expect(WinChecker.win?(values: ['', '', 'X', '', '', 'X', '', '', 'X'], symbol: 'X')).to eq(true)
      expect(WinChecker.win?(values: ['X', '', '', '', 'X', '', '', '', 'X'], symbol: 'X')).to eq(true)
      expect(WinChecker.win?(values: ['', '', 'X', '', 'X', '', 'X', '', ''], symbol: 'X')).to eq(true)
    end
  end

  describe '.tie?' do
    subject { WinChecker.tie?(values: values) }

    context 'when all values are taken' do
      let(:values) { ['X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O'] }

      it 'returns true' do
        expect(WinChecker.tie?(values: values)).to eq(true)
      end
    end
  end
end