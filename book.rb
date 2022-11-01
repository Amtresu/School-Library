require './rental'

class Book
  attr_accessor :title, :author
  attr_reader :rental

  def initalize(title, author, _rentals)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals=(person, date)
    Rental.new(self, person, date)
  end
end
