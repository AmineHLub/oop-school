require_relative './rental'

class Book
  attr_accessor :title, :author
  attr_reader :renters

  def initialize(title, author)
    @title = title
    @author = author
    @renters = []
  end

  def add_rental(person, date)
    Rental.new(@title, person, date)
  end
end
