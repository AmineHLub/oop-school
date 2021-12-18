#!/usr/bin/env ruby
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'
require 'pry'

class App
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
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rental
    else
      puts('Thanks for using the app!')
      exit
    end
  end

  def list_books
    if @all_books.length.positive?
      @all_books.each do |book|
        puts("#{@all_books.find_index(book)}) #{book[:display]}")
      end
    else
      puts 'No books added yet!'
    end
    menu
  end

  def list_people
    if @everyone.length.positive?
      @everyone.each do |person|
        puts("#{@everyone.find_index(person)}) #{person[:display]}")
      end
    else
      puts 'No people added yet!'
    end
    menu
  end

  def create_book
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
    menu
  end

  def create_person
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
    menu
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
    menu
  end

  def create_rental
    if @all_books.length.positive? && @everyone.length.positive?
      @all_books.each { |book| puts("#{@all_books.find_index(book)}) #{book[:display]}") }
      puts('Select a book from the following list')
      selected_book = gets.chomp.to_i
      @everyone.each { |person| puts("#{@everyone.find_index(person)}) #{person[:display]}") }
      puts('Select a book from the following list (not using their id)')
      selected_person = gets.chomp.to_i
      puts('Date')
      selected_date = gets.chomp
      handled_rental(selected_book, selected_person, selected_date)
    else
      puts 'No books or no persons yet!'
      menu
    end
  end

  def handled_rental(selected_book, selected_person, selected_date)
    @all_rentals.push(Rental.new(selected_date, @everyone[selected_person][:object],
                                 @all_books[selected_book][:object]))
    puts('Rental created')
    menu
  rescue NoMethodError
    puts('You selected invalid values, try again!')
    create_rental
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

def main
  puts "Welcome to School Library App!\n"
  start = App.new
  start.menu
end

main
