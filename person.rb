require_relative './nameable'
class Person < Nameable
  attr_accessor :age, :name, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals << rental
  end

  def can_use_services
    if is_of_age || @parent_permission
      true
    elsif !is_of_age || !@parent_permission
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(100..999)
  end
end
