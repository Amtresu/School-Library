require './person'

Class Student < Person

def initialize(classroom, _age, _name = 'Unknown', parent_permission: true)
  @classroom = classroom

  def play_hooky
    '¯(ツ)/¯'
  end
end
