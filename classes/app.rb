require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require 'date'

class App
  def initialize
    @rentals = []
    @books = []
    @people = []
  end

  def entry_point
    puts ''
    puts 'Welcome to the School Library App'
    until input_selection
      input = gets.chomp
      option input
    end
  end

  def back_to_menu
    puts ''
    puts 'Press Enter to go back to the menu'
    gets.chomp
    puts ''
  end

  def input_selection
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals of given person id'
    puts '7 - Quit'
    print 'Enter number of the operation: '
  end

  def option(input)
    case input
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    when '7'
      puts 'Thanks for using my school library app!'
      exit
    else
      'Enter digit from 1 to 7'
    end
  end

  def list_books
    if @books.length.zero?
      puts 'There are no books'
    else
      @books.each_with_index { |book, idx| puts "#{idx}) Book: #{book.title}, Author: #{book.author}" }
    end
    back_to_menu
  end

  def list_people
    puts 'No person available' if @people.length.zero?
    @people.each { |person| puts "[#{person.type}] Name: #{person.name} Age: #{person.age}" }
    back_to_menu
  end

  def create_person
    puts '1 - Create Student  2 - Create Teacher'
    person = gets.chomp
    if person >= "3"
      puts 'invalid selection, please select student or teacher'
      return(create_person)
    end
    print 'Insert age: '
    age = gets.chomp
    if age.empty?
      puts 'No age submitted, please try again'
      return(create_person)
    end
    print 'Insert name: '
    name = gets.chomp.capitalize
    if name.empty?
      puts 'No name submitted, please try again'
      return(create_person)
    end
    person_condition(person, age, name)
    puts 'Person Created Successfully'
    back_to_menu
  end

  def person_condition(person, age, name)
    case person
    when '1'
      print 'Has parents permission [Y/N]: '
      permit = gets.chomp.downcase
      parent_permission = permit != 'n'
      @people.push(Student.new(age, parent_permission, name))
    when '2'
      print 'Insert specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(specialization, age, name)
      @people.push(teacher)
    end
  end

  def create_book
    print 'Enter Book Title: '
    title = gets.chomp
    if title.empty?
      puts 'No title submitted, please try again'
      return(create_book)
    end
    print 'Enter Book Author: '
    author = gets.chomp
    if author.empty?
      puts 'No author submitted, please try again'
      return(create_book)
    end
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book Successfully Created'
    back_to_menu
  end

  def create_rental
    if @books.size.zero?
      puts 'No Books Available'
    elsif @people.size.zero?
      puts 'No Person Available'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index}) Book Title: #{book.title}, Author: #{book.author}" }
      rental_book = gets.chomp.to_i
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index}) #{[person.type]} Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      rental_person = gets.chomp.to_i
      puts 'Enter date'
      date = gets.chomp
      rental_detail = Rental.new(@people[rental_person], @books[rental_book], date)
      @rentals.push(rental_detail)
      puts 'Rental Successfully Created'
    end
    back_to_menu
  end

  def list_rentals
    puts 'Select id of any person'
    @people.each { |i| puts "[#{i.type.to_i}] id: #{i.id}, Person: #{i.name}" }
    print 'Person id: '
    person_id = gets.chomp
    @rentals.each do |i|
      puts "Date: #{i.date}, Book: '#{i.book.title}' by #{i.book.author}" if i.person.id.to_i == person_id.to_i
    end
  end
end
