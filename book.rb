require_relative './rental'

class Book
  def initalize(title, author)
    @title = title
    @author = author
  end

  attr_accessor :title, :author

  has_many :book
end
