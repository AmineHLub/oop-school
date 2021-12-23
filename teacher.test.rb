require_relative './t'

describe Person do
  before :each do
    @teacher = teacher.new('MD', 35, 'Mirriam', true)
  end

  it 'shows instance of student class' do
    expect(@teacher).to be_instance_of Teacher
  end

  it 'matches teacher name' do
    expect(@teacher.name).to match 'Mirriam'
  end

  it 'matches the age' do
    expect(@teacher.age).to match 35
  end

  it 'matches the specialization' do
    expect(@student.specialization).to match 'MD'
  end
end