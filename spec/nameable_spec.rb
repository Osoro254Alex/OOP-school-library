require_relative '../nameable'
require_relative '../person'

describe Nameable do
  context 'Test for Nameable class' do
    person = Person.new(32, 'ricksouslinious')
    person.correct_name
    capitalized_person = CapitalizeDecorator.new(person)
    capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)

    it 'if nameable function will ensure initial cap of name' do
      expect(capitalized_person.correct_name).to eql('Ricksouslinious')
    end
    it 'if nameable function trim name and ensure max length name is 10' do
      expect(capitalized_trimmed_person.correct_name).to eql('Ricksousli')
    end
  end
end
