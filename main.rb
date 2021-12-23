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
  all_books = []
  all_rentals = []
  everyone = []
  puts "Welcome to School Library App!\n"
  start = App.new(everyone, all_books, all_rentals)
  start.menu
end

private

def checker(value)
  File.exist?("./saved_data/#{value}.json")
end

main
