class BookList
  def add_new_book(books)
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter the author of the book: '
    author = gets.chomp
    books << Book.new(title, author)
    puts 'Book created successfully.'
  end

  def show_book_list(books)
    if books.empty?
      puts "\e[31mNo books in the library yet.\e[0m"
    else
      books.each do |book|
        puts show_book(book)
      end
    end
  end

  def show_book(book)
    "\e[34mTitle: \"#{book.title}\", Author: #{book.author} \e[0m"
  end
end
