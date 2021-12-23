require_relative './corrector'
class Person
  attr_reader :rentals
  attr_accessor :age, :name, :id

  DEFAULT_PERM = true
  def initialize(age, name = 'Unknown', parent_permission = DEFAULT_PERM)
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

  private

  def of_age?
    @age >= 18
  end

  def add_rental(rental)
    @rentals << rental
  end
end