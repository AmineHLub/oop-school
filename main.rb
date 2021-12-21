#!/usr/bin/env ruby
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'
require_relative './app'
require 'pry'

def main
  puts "Welcome to School Library App!\n"
  start = App.new
  start.menu
end

main
