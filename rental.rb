require_relative './person'
require_relative './book'
class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(book, person, date)
    @date = date
    @person = person
    @book = book
    person.rentals << @book
    book.rentals << @person
  end
end
