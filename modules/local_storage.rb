require 'json'

module LocalStorage
  def fetch_storage(file)
    file_path = "./data/#{file}.json"
    File.new(file_path, 'w+') unless File.exist?(file_path)
    File.write(file_path, '[]') if File.empty?(file_path)
    contents = File.read(file_path)
    JSON.parse(contents)
  end

  def update_storage(file, data)
    json_data = JSON.pretty_generate(data)
    File.write("./data/#{file}.json", json_data)
  end

  def fetch_books
    fetch_storage('books').map { |book| Book.new(book['title'], book['author']) }
  end

  def fetch_rentals(people, books)
    fetch_storage('rentals').map do |rental|
      Rental.new(people[rental['person_index']], books[rental['book_index']], rental['date'])
    end
  end

  def fetch_people
    fetch_storage('people').map do |person|
      case person['class_name']
      when 'Student'
        Student.new(person['age'], person['parent_permission'], person['name'])
      when 'Teacher'
        Teacher.new(person['specialization'], person['age'], person['name'])
      else
        []
      end
    end
  end
end