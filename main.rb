#!/usr/bin/env ruby
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'
require_relative './app'
require 'json'
require 'pry'

def main
  puts "Welcome to School Library App!\n"
  all_books = []
  everyone = []
  all_rentals = []
  file_creator
  load_data(everyone, all_books, all_rentals)
  start = App.new(everyone, all_books, all_rentals)
  start.menu
end

private

def file_creator
  data = [{ 'all_books' => @all_books }, { 'all_rentals' => @all_rentals },
          { 'everyone' => @everyone }]
  file_checker(data)
end

def file_checker(data)
  data.each do |file|
    File.new("./saved_data/#{file.keys[0]}.json", 'w') unless File.exist?("./saved_data/#{file.keys[0]}.json")
  end
end

def load_data(everyone, all_books, all_rentals)
  load_books(all_books)
  load_everyone(everyone)
  load_rentals(everyone, all_books, all_rentals)
end

def load_books(all_books)
  File.open('./saved_data/all_books.json', 'r+') do |file|
    data = JSON.parse(file.read)
    data.each do |book_data|
      book = Book.new(book_data['title'], book_data['author'])
      all_books.push(
        { display: "Title: #{book_data['title']}, Author: #{book_data['author']}",
          object: book }
      )
    end
  rescue JSON::ParserError
    all_books = []
  end
end

def load_everyone(everyone)
  File.open('./saved_data/everyone.json', 'r+') do |file|
    data = JSON.parse(file.read)
    data.each do |person_data|
      if person_data.keys.include?('specialization')
        load_teacher(person_data, everyone)
      else
        load_student(person_data, everyone)
      end
    end
  rescue JSON::ParserError
    everyone = []
  end
end

def load_teacher(data, everyone)
  teacher = Teacher.new(data['specialization'], data['age'], data['name'])
  teacher.id = data['id']
  everyone.push(
    { display: "[Teacher] Name: #{teacher.name}, ID: #{teacher.id} Age: #{teacher.age}",
      object: teacher }
  )
end

def load_student(data, everyone)
  student = Student.new('any', data['age'], data['name'])
  student.id = data['id']
  everyone.push(
    { display: "[Student] Name: #{student.name}, ID: #{student.id} Age: #{student.age}",
      object: student }
  )
end

def load_rentals(everyone, all_books, all_rentals)
  File.open('./saved_data/all_rentals.json', 'r+') do |file|
    data = JSON.parse(file.read)
    data.each do |rental_data|
      all_rentals.push(Rental.new(rental_data['date'],
                                  person_selection(everyone, rental_data),
                                  book_selection(all_books, rental_data)))
    end
  rescue JSON::ParserError
    all_rentals = []
  end
end

def person_selection(everyone, rental_data)
  selected_user = ''
  everyone.each do |person|
    selected_user = person[:object] if person[:object].id == rental_data['id']
  end
  selected_user
end

def book_selection(all_books, rental_data)
  selected_book = ''
  all_books.each do |book|
    if book[:object].title == rental_data['title'] && book[:object].author == rental_data['author']
      selected_book = book[:object]
    end
  end
  selected_book
end

def checker(value)
  File.exist?("./saved_data/#{value}.json")
end

main
