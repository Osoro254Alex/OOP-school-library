require_relative './person'
class Teacher < Person
  def initialize(age, name = 'Unknown', parent_permission: false, specialization: nil)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services
    return unless (is_of_age || !is_of_age) || (@parent_permission || !@parent_permission)

    true
  end
end
