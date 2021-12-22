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
  if checker('all_books')
    File.open('./saved_data/all_books.json', 'r') do |file|
      all_books = JSON.parse(file.read)
    rescue JSON::ParserError
      all_books = []
    end
  end
  if checker('all_rentals')
    File.open('./saved_data/all_rentals.json', 'r') do |file|
      all_rentals = JSON.parse(file.read)
    rescue JSON::ParserError
      all_rentals = []
    end
  end
  if checker('everyone')
    File.open('./saved_data/everyone.json', 'r') do |file|
      everyone = JSON.parse(file.read)
    rescue JSON::ParserError
      everyone = []
    end
  end
  puts "Welcome to School Library App!\n"
  start = App.new(everyone, all_books, all_rentals)
  binding.pry
  start.menu
end

private

def checker(value)
  File.exist?("./saved_data/#{value}.json")
end

main
