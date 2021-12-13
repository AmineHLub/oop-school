module Person
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
      is_of_age? || @parent_permission
    end

    private

    def isof_age?
      true if @age >= 18
      false
    end
  end
end