require 'pry'
require 'json'
class ExitAndStore
  def initialize(data)
    @all_books = data.all_books
    @all_rentals = data.all_rentals
    @everyone = data.everyone
  end

  def save
    data = [{ 'all_books' => @all_books }, { 'all_rentals' => @all_rentals },
            { 'everyone' => @everyone }]
    file_checker(data)
    data.each do |storage|
      old_storage = []
      File.open("./saved_data/#{storage.keys[0]}.json", 'r') do |file|
        old_storage = JSON.parse(file.read)
      rescue JSON::ParserError
        old_storage = []
      end
      File.open("./saved_data/#{storage.keys[0]}.json", 'w+') do |file|
        new_storage = old_storage + storage[storage.keys[0]]
        file.write(JSON.generate(new_storage))
      end
    end
  end

  def file_checker(data)
    data.each do |file|
      File.new("./saved_data/#{file.keys[0]}.json", 'w') unless File.exist?("./saved_data/#{file.keys[0]}.json")
    end
  end
end
