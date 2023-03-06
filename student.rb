require_relative './person'
class Student < Person
  def initialize(id, name, classroom, age = 'Unknown', parent_permission: false)
    super(id, name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
