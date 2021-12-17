require_relative './person'
require_relative './book'
class Rental
  attr_accessor :date, :person, :book

  def initialize(book, person, date)
    @date = date
    @person = person
    @book = book
    person.rentals << self
    book.rentals << self
  end
end
