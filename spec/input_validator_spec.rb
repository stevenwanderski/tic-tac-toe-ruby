require_relative '../app/input_validator'

describe InputValidator do
  describe '.run' do
    context 'value is not in VALID_INPUTS' do
      it 'returns false' do
        expect(InputValidator.run('9', nil)).to eq(false)
      end
    end

    context 'value is unavailable' do
      it 'returns false' do
        values = ['X', ' ']
        expect(InputValidator.run('0', values)).to eq(false)
      end
    end

    context 'value is in VALID_INPUTS and is available in values' do
      it 'returns true' do
        values = [' ', ' ']
        expect(InputValidator.run('0', values)).to eq(true)
      end
    end
  end
end