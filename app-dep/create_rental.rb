class CreateRental
  def initialize(everyone, all_books, all_rentals, self_value)
    @everyone = everyone
    @all_books = all_books
    @all_rentals = all_rentals
    @self_value = self_value
  end

  def create_rental
    if @all_books.length.positive? && @everyone.length.positive?
      listing(@all_books)
      puts('Select a book from the following list')
      selected_book = gets.chomp.to_i
      listing(@everyone)
      puts('Select a book from the following list (not using their id)')
      selected_person = gets.chomp.to_i
      puts('Date')
      selected_date = gets.chomp
      handled_rental(selected_book, selected_person, selected_date)
    else
      puts 'No books or no persons yet!'
    end
  end

  def handled_rental(selected_book, selected_person, selected_date)
    @all_rentals.push(Rental.new(selected_date, @everyone[selected_person][:object],
                                 @all_books[selected_book][:object]))
    puts('Rental created')
    @self_value.menu
  rescue NoMethodError
    puts('You selected invalid values, try again!')
    create_rental
  end
end
