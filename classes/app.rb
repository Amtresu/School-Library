require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require './modules/ModBook'
require './modules/ModPeople'
require './modules/ModRentals'
require 'date'

class App
  include ModBook
  include ModPeople
  include ModRentals

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

  def option(input) # rubocop:disable Metrics/CyclomaticComplexity
    case input
    when '1'
      App.new.list_books(@books)
    when '2'
      App.new.list_people(@people)
    when '3'
      App.new.create_person(@people)
    when '4'
      App.new.create_book(@books)
    when '5'
      App.new.create_rental(@books, @people, @rentals)
    when '6'
      App.new.list_rentals(@books, @people, @rentals)
    when '7'
      puts 'Thanks for using the school library!'
      exit
    end
  end
end
