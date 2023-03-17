require_relative './person'

require 'json'
class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission: true, classroom: nil)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def create_object
    super()
    object_data = @object_data
    object_data[:classroom] = @classroom
    object_data[:class] = 'Student'
    object_data[:parent_permission] = @parent_permission
    object_data
  end
end
