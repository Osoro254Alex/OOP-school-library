class Rentals
  def add_new_rental(books, people, rentals)
    book = select_book(books)
    person = select_person(people)
    if person && book
      print 'Date: '
      date = gets.chomp.to_s
      rentals << Rental.new(date, book, person)
      puts 'Rental created successfully.'
    else
      puts "\e[31mInvalid person or book selected. Please try again.\e[0m"
    end
  end

  def select_book(books)
    puts 'Select a book from the following list by number '
    books.each_with_index do |book, index|
      puts "\e[34m#{index + 1}. #{BookList.new.show_book(book)}\e[0m"
    end
    book_idx = gets.chomp.to_i - 1
    books[book_idx]
  end

  def select_person(people)
    puts 'Select a person from the following list by number (not id) '
    people.each_with_index do |person, index|
      puts "\e[34m#{index + 1}. #{People.new.show_person(person)} \e[0m"
    end
    person_idx = gets.chomp.to_i - 1
    people[person_idx]
  end

  def show_rentals(people, rentals)
    print 'ID of person: '
    person_id = gets.chomp.to_i
    selected_person = people.select { |person| person.id == person_id }
    if rentals.empty?
      puts "\e[31mNo rentals found for this person. Please try again.\e[0m"
    else
      puts 'Rentals: '
      if person_id.zero?
        rentals.each do |rental|
          puts "\e[34mDate: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}\e[0m"
        end
      else
        rentals.each do |rental|
          if rental.person == selected_person[0]
            puts "\e[34mDate: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}\e[0m"
          end
        end
      end
    end
  end
end
