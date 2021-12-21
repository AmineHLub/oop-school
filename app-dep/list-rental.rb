class ListRental
    def initialize(everyone, all_books, all_rentals)
      @everyone = everyone
      @all_books = all_books
      @all_rentals = all_rentals
    end
  
    def list_rental
      puts('Rentals: ')
      print('ID of person: ')
      selected_id = gets.chomp.to_i
      puts('Rentals: ')
      @all_rentals.each do |rental|
        if rental.person.id == selected_id
          puts("Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}")
        end
      end
    end
  end