
class CreateBook
    def initialize(all_books)
      @all_books = all_books
    end
    
    def create_book
    print('Title: ')
    title = gets.chomp
    print('Author: ')
    author = gets.chomp
    book = Book.new(title, author)
    @all_books.push(
      { display: "Title: #{title}, Author: #{author}",
        object: book }
    )
    puts('Book created successfully!')
  end
end