require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require './modules/mod_book'
require './modules/mod_people'
require './modules/mod_rentals'
require './modules/local_storage'
require './modules/user_methods'
require 'json'

class App
  include ModBook
  include ModPeople
  include ModRentals
  include LocalStorage
  include UserMethods

  def initialize
    @books = fetch_books
    @people = fetch_people
    @rentals = fetch_rentals(@people, @books)
  end

  def entry_point
    puts ''
    puts 'Welcome to the School Library App'
    until menu
      input = gets.chomp
      option input
    end
  end
end
