require_relative './nameable'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'
require_relative './rental'
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
    of_age? || @parent_permission
  end

  def create_object
    object_data = { age: @age, name: @name, id: @id }
    @object_data = object_data
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(100..999)
  end
end
