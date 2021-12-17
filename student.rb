require_relative './Classroom'
class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    @name = name
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  classroom.students << @name if classroom.students&.exclude?(@name)

  def classroom_setter(newclass)
    @classroom = newclass.lable
    classroom.students << @name
  end
end
