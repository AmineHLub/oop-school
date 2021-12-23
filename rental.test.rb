require_relative './rental'
require_relative './book'
require_relative './person'
require_relative './teacher'

describe Rental do
  before :each do
    @teacher = Teacher.new('MD', 35, 'Mirriam', true)
    @book = Book.new('test book', 'test author')
    @rental = Rental.new('2020', @teacher, @book)
  end

  it 'shows instance of Rental' do
    expect(@rental).to be_instance_of Rental
  end

  it 'matches date' do
    expect(@rental.date).to match '2020'
  end

  it 'matches the book title' do
    expect(@rental.book.title).to match 'test book'
  end

  it 'matches the person name' do
    expect(@rental.person.name).to match 'Mirriam'
  end
end
