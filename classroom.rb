class Classroom
  attr_accessor :lable
  attr_reader :students

  def initialize(lable)
    @lable = lable
    @students = []
  end

  def add_students(name)
    @students << name
    name.classroom_setter = name unless @students.include?(name)
  end
end
