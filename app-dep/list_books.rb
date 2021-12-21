class ListBooks
  def initialize(all_books)
    @all_books = all_books
  end

  def list_books
    if @all_books.length.positive?
      listing(@all_books)
    else
      puts 'No books added yet!'
    end
  end
end
