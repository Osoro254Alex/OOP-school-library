require_relative './person'
class Teacher < Person
  def initialize(id, name, specialization, age = 'Unknown', parent_permission: false)
    super(id, name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services
    return unless (is_of_age || !is_of_age) || (@parent_permission || !@parent_permission)

    true
  end
end
