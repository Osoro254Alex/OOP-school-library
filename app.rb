require_relative './books'
require_relative './people'
require_relative './rentals'
require_relative './storage_file'
require_relative './person'
require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require 'json'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books_file_path = DataFile.new('books')
    @people_file_path = DataFile.new('people')
    @rentals_file_path = DataFile.new('rentals')

    @books = @books_file_path.load_data.map { |book| Book.new(book['title'], book['author']) }
    @people = @people_file_path.load_data.map do |person|
      if person['class'].include?('Student')
        Student.new(person['age'], person['name'], parent_permission: person['parent_permission'],
                                                   classroom: person['classroom'])
      else
        Teacher.new(person['age'], person['name'], parent_permission: person['parent_permission'],
                                                   specialization: person['specialization'])
      end
    end
    @rentals = @rentals_file_path.load_data.map do |rental|
      book = @books.select { |bk| bk.title == rental['book']['title'] && bk.author == rental['book']['author'] }[0]
      person = @people.select { |pers| pers.name == rental['person']['name'] && pers.age = rental['person']['age'] }[0]
      Rental.new(rental['date'], book, person)
    end
  end

  def command_call(option)
    case option
    when 1
      BookList.new.show_book_list(books)
    when 2
      People.new.show_people(people)
    when 3
      People.new.add_new_person(people)
      @people_file_path.save_data(@people.map(&:create_object))
    when 4
      BookList.new.add_new_book(books)
      @books_file_path.save_data(@books.map(&:create_object))
    when 5
      if books.empty? || people.empty?
        puts "\e[31mNo books or people in the library yet.\e[0m"
        return
      end
      Rentals.new.add_new_rental(books, people, rentals)
      @rentals_file_path.save_data(@rentals.map(&:create_object))
    when 6
      if rentals.empty?
        puts "\e[31mNo rental done in the library yet.\e[0m"
        return
      end
      Rentals.new.show_rentals(people, rentals)
    end
  end
end

def select_book
  puts 'Select a book from the following list by number '
  @books.each_with_index do |book, index|
    puts "\e[34m#{index + 1}. Title: \"#{book.title}\", Author: #{book.author} \e[0m"
  end
  book_idx = gets.chomp.to_i - 1
  @books[book_idx]
end

def select_person
  puts 'Select a person from the following list by number (not id) '
  @people.each_with_index do |person, index|
    puts "\e[34m#{index + 1}. [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} \e[0m"
  end
  person_idx = gets.chomp.to_i - 1
  @people[person_idx]
end

def all_rentals_for_person
  print 'ID of person: '
  person_id = gets.chomp.to_i
  rentals = @rentals.select { |r| r.person.id == person_id }
  if rentals.empty?
    puts "\e[31mNo rentals found for this person. Please try again.\e[0m"
  else
    puts 'Rentals: '
    rentals.each do |rental|
      puts "\e[34mDate: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}\e[0m"
    end
  end
end
