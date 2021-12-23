require_relative './classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('class A ')
  end

  it 'shows instance of student' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'shows class name' do
    expect(@classroom.label).to match 'class A'
  end
end
