require_relative './book'
require_relative './person'
require 'json'
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @book.rentals << self
    @person.rentals << self
  end

  def create_object
    object_data = {}
    object_data[:book] = { title: @book.title, author: @book.author }
    object_data[:person] = { id: @person.id, age: @person.age, name: @person.name, class: @person.class }
    object_data[:date] = @date
    object_data
  end
end
