require_relative 'app'

def main
  app = App.new
  puts "\e[32mWelcome to School Library App\e[0m"
  loop do
    puts "\n\e[32mPlease choose an option by entering a number: \e[0m"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'

    input = gets.chomp.to_i
    exit_app if input == 7
    run(app, input)
  end
end

def run(app, input)
  @options = {
    1 => app.method(:all_books),
    2 => app.method(:all_people),
    3 => app.method(:create_person),
    4 => app.method(:create_book),
    5 => app.method(:create_rental),
    6 => app.method(:all_rentals_for_person)
  }
  option = @options[input]
  if option
    option.call
  else
    puts "\e[31mInvalid option. Try again.\e[0m"
  end
end

def exit_app
  puts "\e[32mThank you for using this app!\e[0m"
  sleep(1)
  exit
end

main
