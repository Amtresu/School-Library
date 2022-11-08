require_relative './mod_rentals'

module UserMethods
  def menu_return
    puts ''
    puts 'Press Enter to go back to the menu'
    gets.chomp
    puts ''
  end

  def menu
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all current rentals per person'
    puts '7 - Quit'
    print 'Enter number of the operation: '
  end

  def option(input) # rubocop:disable Metrics/CyclomaticComplexity
    case input
    when '1'
      App.new.display_books(@books)
    when '2'
      App.new.display_people(@people)
    when '3'
      App.new.create_person(@people)
    when '4'
      App.new.create_book(@books)
    when '5'
      App.new.space_checker(@books, @people, @rentals)
    when '6'
      App.new.display_rentals(@rentals, @people)
    when '7'
      puts 'Thanks for using the school library!'
      exit
    end
  end
end
