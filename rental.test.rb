require_relative './rental'

describe Person do
  before :each do
    @rental = rental.new('2020, Benard','insomnia')
  end

  it 'shows instance of student class' do
    expect(@rental.to be_instance_of Teacher
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