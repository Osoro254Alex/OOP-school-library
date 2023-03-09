require_relative './nameable'
class Person < Nameable
  def initialize(id, name, age = 'Unknown', parent_permission: false)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def display_info
    { 'id' => @id, 'name' => @name, 'age' => @age }
  end

  def set_info(name, age)
    @name = name
    @age = age
  end

  def can_use_services
    if is_of_age || @parent_permission
      true
    elsif !is_of_age || !@parent_permission
      false
    end
  end

  private

  def of_age
    if @age.to_i > 18
      true
    elsif @age.to_i < 18
      false
    end
  end
end
