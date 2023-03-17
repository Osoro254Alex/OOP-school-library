require_relative '../teacher'

describe Teacher do
  context 'Test the Teacher class' do
    age = 25
    name = 'Sherwani'
    specialization = 'python'
    teacher = Teacher.new(age, name, specialization: specialization)
    it 'if is instance of class' do
      expect(teacher.instance_of?(Teacher)) == true
    end
    it 'if there are right age' do
      expect(teacher.age).to eq 25
    end
    it 'if there are right name' do
      expect(teacher.name).to eq 'Sherwani'
    end
    it 'if can rent a book' do
      expect(teacher.can_use_services).to eq true
    end
  end
end
