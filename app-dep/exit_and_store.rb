require 'json'
class ExitAndStore
  def initialize(data)
    @all_books = data.all_books
    @all_rentals = data.all_rentals
    @everyone = data.everyone
  end

  def save
    persons = []
    books = []
    rented = []
    File.write('./saved_data/all_books.json', JSON.generate(json_book(@all_books, books)))
    File.write('./saved_data/everyone.json', JSON.generate(json_person(@everyone, persons)))
    File.write('./saved_data/all_rentals.json', JSON.generate(json_rents(@all_rentals, rented)))
  end

  def json_rents(array, rents)
    array.each do |sub_arr|
      rents << { id: sub_arr.person.id,
                 date: sub_arr.date,
                 title: sub_arr.book.title,
                 author: sub_arr.book.author }
    end
    rents
  end

  def json_book(array, books)
    array.each do |sub_arr|
      books << { title: sub_arr[:object].title,
                 author: sub_arr[:object].author }
    end
    books
  end

  def json_person(array, persons)
    array.each do |sub_arr|
      json_student(sub_arr, persons) if sub_arr[:object].instance_of?(Student)
      json_teacher(sub_arr, persons) if sub_arr[:object].instance_of?(Teacher)
    end
    persons
  end

  def json_student(array, persons)
    persons << { id: array[:object].id,
                 age: array[:object].age,
                 name: array[:object].name }
  end

  def json_teacher(array, persons)
    persons << { id: array[:object].id,
                 age: array[:object].age,
                 name: array[:object].name,
                 specialization: array[:object].specialization }
  end
end
