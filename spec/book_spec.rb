require_relative '../book'

describe Book do
  context 'Test Book class' do
    before(:context) do
      title = 'God of war'
      author = 'Rickie Chan'
      @book = Book.new(title, author)
    end

    it 'if it is instance of a class' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'if book title is God of war' do
      expect(@book.title).to eq('God of war')
    end

    it 'if book author is Rickie Chan' do
      expect(@book.author).to eq('Rickie Chan')
    end
  end
end
