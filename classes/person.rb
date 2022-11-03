require_relative './nameable'
require_relative './rental'

class Person < Nameable
  def initialize(age, parent_permission, name)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def correct_name
    @name
  end

  attr_reader :id, :rentals
  attr_accessor :name, :age

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age?
  end

  def add_rentals=(book, date)
    Rental.new(book, self, date)
  end

  private :of_age?
end
