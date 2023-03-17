require_relative '../student'
require_relative '../classroom'

describe Student do
  context 'Test for the Student class' do
    age = 25
    name = 'Sherwani'
    classroom = 'python'
    parent_permission = true
    student = Student.new(age, name, parent_permission: parent_permission, classroom: classroom)
    it 'if is an istance of class' do
      expect(student).to be_an_instance_of(Student)
    end
    it 'if it is correct age' do
      expect(student.age).to eql(25)
    end
    it 'if it is correct name' do
      expect(student.name).to eql('Sherwani')
    end
    it 'if it is correct classroom' do
      expect(student.classroom).to eql('python')
    end
    it 'if it plays hooky ¯\(ツ)/¯' do
      expect(student.play_hooky).to eql('¯(ツ)/¯')
    end
  end
end
