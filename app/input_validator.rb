class InputValidator
  VALID_INPUTS = ['0', '1', '2', '3', '4', '5', '6', '7', '8']

  def self.run(value, values)
    return false if !VALID_INPUTS.include?(value)

    return false if values[value.to_i] != ' '

    true
  end
end
