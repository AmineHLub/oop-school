#!/usr/bin/env ruby
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'

def App(selected)
    
end

def main
puts "Welcome to School Library App!\n"
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
App(selected)
end

main()