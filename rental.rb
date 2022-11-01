require './book'
require './person'

class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initalize(date, book, person)
    @date = date

    @person = person
    person.rentals.push(self)

    @book = book
    book.rentals.push(self)
  end
end
