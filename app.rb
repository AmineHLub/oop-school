class App
  attr_accessor :@everyone, :@all_books, :@all_rentals
  def initialize(everyone = [], all_books = [], all_rentals = [])
    @everyone = everyone
    @all_books = all_books
    @all_rentals = all_rentals
  end

  def menu
    puts "Please choose an option by entering a number :\n"
    puts "1 - List all books:\n"
    puts "2 - List all peoples:\n"
    puts "3 - Create a person:\n"
    puts "4 - Create a book:\n"
    puts "5 - Create a rental:\n"
    puts "6 - List all rental for a given id:\n"
    puts "7 - exit:\n"
    puts "\n"
    selected = gets.chomp.to_i
    choice(selected)
  end

  def choice(selected)
    case selected
    when 1
      List_books.new(@all_books)
    when 2
      List_people.new(@everyone)
    when 3
      Create_person.new(@everyone)
    when 4
      Create_book.new(@all_books)
    when 5
      Create_rental.new(@everyone,@all_books)
    when 6
      List_rental.new(@everyone,@all_books)
    else
      puts('Thanks for using the app!')
      exit
    end
  end
end

  

  def listing(array)
    array.each do |element|
      puts("#{array.find_index(element)}) #{element[:display]}")
    end
  end

  class List_books
    def initialize(all_books)
    @all_books = all_books
    end
  def listing_books
    if @all_books.length.positive?
      listing(@all_books)
    else
      puts 'No books added yet!'
    end
    start.menu
    end
  end

  class List_people
    def initialize(everyone)
    @everyone = everyone
    end

    def listing_people
      if @everyone.length.positive?
        listing(@everyone)
      else
        puts 'No people added yet!'
      end
      start.menu
    end
  end

  class Create_book
    def initialize(all_books)
      @all_books = all_books
    end

  def creating_book
    print('Title: ')
    title = gets.chomp
    print('Author: ')
    author = gets.chomp
    book = Book.new(title, author)
    @all_books.push(
      { display: "Title: #{title}, Author: #{author}",
        object: book }
    )
    puts('Book created successfully!')
    start.menu
  end
end

  class Create_people

  def initialize(everyone)
  @everyone = everyone
  end

  def creating_person
    print('Do you want to create a student(1) or a teacher(2)? [Input the number]:')
    selected = gets.chomp.to_i
    if selected != 1 && selected != 2
      puts('invalid, select 1 for teacher or 2 for student')
      create_person
    end
    case selected
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_teacher
    print('Age: ')
    age = gets.chomp
    print('Name: ')
    name = gets.chomp
    print('Specialization: ')
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @everyone.push(
      { display: "[Teacher] Name: #{name}, ID: #{teacher.id} Age: #{age}",
        object: teacher }
    )
    puts('Person created successfully!')
    start.menu
  end

  def create_student
    puts('Age: ')
    age = gets.chomp
    puts('Name: ')
    name = gets.chomp
    puts('Has parent permission? [ Y | N ]')
    parental_permission = gets.chomp
    parental_permission = case parental_permission.downcase
                          when 'y'
                            true
                          else
                            false
                          end
    student = Student.new('Any', age, name, parental_permission)
    @everyone.push({ display: "[Student] Name: #{name}, ID: #{student.id} Age: #{age}",
                     object: student })
    puts('Person created successfully!')
    start.menu
  end
end

class Create_rental
  def initialize(everyone,all_books)
    @everyone = everyone
    @all_books = all_books
  end

  def creating_rental
    if @all_books.length.positive? && @everyone.length.positive?
      listing(@all_books)
      puts('Select a book from the following list')
      selected_book = gets.chomp.to_i
      listing(@everyone)
      puts('Select a book from the following list (not using their id)')
      selected_person = gets.chomp.to_i
      puts('Date')
      selected_date = gets.chomp
      handled_rental(selected_book, selected_person, selected_date)
    else
      puts 'No books or no persons yet!'
      start.menu
    end
  end

  def handled_rental(selected_book, selected_person, selected_date)
    @all_rentals.push(Rental.new(selected_date, @everyone[selected_person][:object],
                                 @all_books[selected_book][:object]))
    puts('Rental created')
    start.menu
  rescue NoMethodError
    puts('You selected invalid values, try again!')
    creating_rental
  end
end

class List_rental
  def initialize(everyone,all_books)
    @everyone = everyone
    @all_books = all_books
  end

  def list_rental
    puts('Rentals: ')
    print('ID of person: ')
    selected_id = gets.chomp.to_i
    puts('Rentals: ')
    @all_rentals.each do |rental|
      if rental.person.id == selected_id
        puts("Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}")
      end
    end
    menu
  end
end
