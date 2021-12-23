require_relative './person'
require_relative './student'

describe Person do
  before :each do
    @person = Person.new(35, 'John', true)
    @second_person = Person.new(35, 'John', false)
  end

  it 'shows instance of person class' do
    expect(@person).to be_instance_of Person
  end

  it 'matches name' do
    expect(@person.name).to match 'John'
  end

  it 'matches age' do
    expect(@person.age).to match 35
  end

  it 'matches parent permission' do
    expect(@person.can_use_services?).to match true
  end

  it 'matches parent permission for second' do
    expect(@second_person.can_use_services?).to match true
  end
end
