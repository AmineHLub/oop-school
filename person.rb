class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    isof_age? || "#{@parent_permission}, He has parental permission"
  end

  private

  def isof_age?
    @age > 18
  end
end

mido = Person.new(17, 'mido', parent_permission: false)
puts(mido.name)
puts(mido.age)
puts(mido.can_use_services?)
