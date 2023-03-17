require_relative '../person'

describe Person do
  context 'Test the Person class' do
    age = 25
    name = 'Sherwani'
    person = Person.new(age, name, parent_permission: false)
    it 'if it is right class name' do
      expect(person.class.name) == Person
    end
    it 'if has right age' do
      expect(person.age).to eq 25
    end
    it 'if has right name' do
      expect(person.name).to eq 'Sherwani'
    end
  end
end
