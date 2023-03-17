require_relative '../trimmer_decorator'

RSpec.describe TrimmerDecorator do
  describe '#correct_name' do
    let(:nameable) { double('nameable', correct_name: 'alex ogeto') }
    let(:decorator) { TrimmerDecorator.new(nameable) }

    it 'returns full name when it is shorter than maximum length' do
      expect(decorator.correct_name).to eq('alex ogeto')
    end

    it 'returns truncated name when it is longer than maximum length' do
      nameable = double('nameable', correct_name: 'Salamanke Rickson')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name).to eq('Salamanke ')
    end

    it 'returns an empty string when the decorated object returns an empty string' do
      nameable = double('nameable', correct_name: '')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name).to eq('')
    end
  end
end
