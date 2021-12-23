require_relative './app-dep/create_book'
require_relative './app-dep/create_people'
require_relative './app-dep/create_rental'
require_relative './app-dep/list_books'
require_relative './app-dep/list_people'
require_relative './app-dep/list_rental'
require_relative './app-dep/exit_and_store'
class App
  attr_accessor :everyone, :all_books, :all_rentals

  def initialize(everyone, all_books, all_rentals)
    @everyone = everyone
    @all_books = all_books
    @all_rentals = all_rentals
  end

  def menu
    puts "Please choose an option by entering a number :\n"
    puts "1 - List all books:\n"
    puts "2 - List all peoples:\n"
    puts "3 - Create a person:\n"
    puts "4 - Create a book:\n"
    puts "5 - Create a rental:\n"
    puts "6 - List all rental for a given id:\n"
    puts "7 - exit:\n"
    puts "\n"
    selected = gets.chomp.to_i
    choice(selected)
  end

  def choice(selected)
    case selected
    when 1
      ListBooks.new(@all_books).list_books
      menu
    when 2
      ListPeople.new(@everyone).list_people
      menu
    when 3
      CreatePeople.new(@everyone).create_person
      menu
    when 4
      CreateBook.new(@all_books).create_book
      menu
    when 5
      CreateRental.new(@everyone, @all_books, @all_rentals, self).create_rental
      menu
    when 6
      ListRental.new(@everyone, @all_books, @all_rentals).list_rental
      menu
    else
      ExitAndStore.new(self).save
      puts('Thanks for using the app!')
      exit
    end
  end
end

def listing(array)
  array.each do |element|
    puts("#{array.find_index(element)}) #{element[:display]}")
  end
end
