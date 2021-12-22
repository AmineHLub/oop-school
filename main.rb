#!/usr/bin/env ruby
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'
require_relative './app'


def main
  def file_checker(data)
    File.exist?("./saved_data/all_books.json") 
    ("./saved_data/all_rentals.json") 
    ("./saved_data/everyone.json")    
  puts "Welcome to School Library App!\n"
  start = App.new
  start.menu
  end
end
