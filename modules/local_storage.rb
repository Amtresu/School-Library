require 'json'

module LocalStorage
  def fetch_storage(file)
    path = "./data/#{file}.json"
    File.new(path, 'w+') unless File.exist?(path)
    File.write(path, '[]') if File.empty?(path)
    file_contents = File.read(path)
    JSON.parse(file_contents)
  end

  def update_storage(file, data)
    file_data = JSON.pretty_generate(data)
    File.write("./data/#{file}.json", file_data)
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
