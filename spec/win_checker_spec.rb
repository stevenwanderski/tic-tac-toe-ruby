require_relative '../app/win_checker'

describe WinChecker do
  describe '.run' do
    it 'returns true' do
      expect(WinChecker.run(['X', 'X', 'X', '', '', '', '', '', ''], 'X')).to eq(true)
      expect(WinChecker.run(['', '', '', 'X', 'X', 'X', '', '', ''], 'X')).to eq(true)
      expect(WinChecker.run(['', '', '', '', '', '', 'X', 'X', 'X'], 'X')).to eq(true)
      expect(WinChecker.run(['X', '', '', 'X', '', '', 'X', '', ''], 'X')).to eq(true)
      expect(WinChecker.run(['', 'X', '', '', 'X', '', '', 'X', ''], 'X')).to eq(true)
      expect(WinChecker.run(['', '', 'X', '', '', 'X', '', '', 'X'], 'X')).to eq(true)
      expect(WinChecker.run(['X', '', '', '', 'X', '', '', '', 'X'], 'X')).to eq(true)
      expect(WinChecker.run(['', '', 'X', '', 'X', '', 'X', '', ''], 'X')).to eq(true)
    end
  end
end