require './nameable'
require_relative './rental'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..9999)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  private :of_age?

  def can_use_services?
    of_age?
  end

  has_many :rental
end
