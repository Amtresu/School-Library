require './person'

class Teacher < Person
  def initialize(specialization, _age, _name = 'Unknown')
    @specialization = specialization
    super(age, name)
  end

  def can_use_services?
    true
  end
end
