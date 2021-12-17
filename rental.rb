require_relative './person'
require_relative './book'
class Rental
  attr_reader :person, :rentals
  attr_accessor :date

  def initialize(rentals, person, date)
    @date = date
    @person = person
    @rentals = rentals
    person.rentals << @book
    book.rentals << @person
  end
end
