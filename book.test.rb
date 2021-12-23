require_relative './book'

describe Book do
  before :each do
    @book = Book.new('test book', 'test author')
  end

  it 'shows instance of book class' do
    expect(@book).to be_instance_of Book
  end

  it 'matches title name' do
    expect(@book.title).to match 'test book'
  end

  it 'test book author to be test author' do
    expect(@book.author).to match 'test author'
  end
end
