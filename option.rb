class Option
  def show_options
    puts "\n\e[32mPlease choose an option by entering a number: \e[0m"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given Person id'
    puts '7. Exit'
  end
end
