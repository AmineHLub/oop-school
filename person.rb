require_relative './corrector'
require_relative './rental'
class Person
  attr_reader :id, :rentals
  attr_accessor :age, :name, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(book, date)
    Rental.new(book, @name, date)
  end

  private

  def of_age?
    @age >= 18
  end
end
