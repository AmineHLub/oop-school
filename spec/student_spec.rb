require_relative '../student'
require_relative '../person'

describe Person do
  before :each do
    @student = Student.new('class A', 18, 'Max', true)
  end

  it 'shows instance of student class' do
    expect(@student).to be_instance_of Student
  end

  it 'matches student name' do
    expect(@student.name).to match 'Max'
  end

  it 'matches the age' do
    expect(@student.age).to match 18
  end

  it 'matches the class' do
    expect(@student.classroom).to match 'class A'
  end
end
