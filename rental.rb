require_relative './book'
require_relative './person'

class Rental
  attr_reader :book, :person

  def initalize(date, book, person)
    @date = date

    @person = person
    person.rentals.push(self)

    @book = book
    book.rentals.push(self)
  end

  attr_accessor :date

  belongs_to :book
  belongs_to :person
end
