require './classes/book'
require './classes/person'
require './classes/rental'
require_relative './local_storage'

module ModRentals
  include LocalStorage

  def space_checker(books, people, rentals)
    if books.size.zero?
      puts 'No Books Available to Rent'
    elsif people.size.zero?
      puts 'No People Available to Rent to'
    else
      create_rental(books, people, rentals)
    end
    menu_return
  end

  def create_rental(books, people, rentals)
    rental_storage = fetch_storage('rentals')
    puts 'Select a book to rent'
    books.each_with_index { |book, index| puts "#{index}) Book Title: #{book.title}, Author: #{book.author}" }
    rental_book = gets.chomp
    puts 'Select Person by their ID'
    people.each_with_index do |person, index|
      puts "#{index}) #{[person.type]} Name: #{person.name} Age: #{person.age} Id: #{person.id}"
    end
    rental_person = gets.chomp
    puts 'Enter date of Rental'
    date = gets.chomp
    rental_item = Rental.new(people[rental_person], books[rental_book], date)
    rental_data = { date: date, book_index: rental_book, person_index: rental_person }
    rentals.push(rental_item)
    rental_storage.push(rental_data)
    update_storage('rentals', rental_storage)
    puts 'Rental Successfully Created'
  end
end

def display_rentals(rentals, people)
  puts 'Select the ID of a person.'
  people.each { |i| puts "[#{i.type.to_i}] id: #{i.id}, Person: #{i.name}" }
  print 'Person id: '
  person_id = gets.chomp
  rentals.each do |i|
    puts "Date: #{i.date}, Book: '#{i.book.title}' by #{i.book.author}" if i.person.id.to_i == person_id.to_i
  end
end
