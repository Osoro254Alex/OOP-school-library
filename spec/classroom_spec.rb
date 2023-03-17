require_relative '../classroom'

describe Classroom do
  context 'Test Classroom class' do
    classroom = Classroom.new('python')

    it 'if there is correct label' do
      expect(classroom.label) == 'python'
    end

    it 'if there is no students' do
      expect(classroom.students.size) == 0
    end
  end
end
