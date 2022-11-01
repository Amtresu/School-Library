require './person'
require_relative './classroom'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(age, name, parent_permission)
  end

  def play_hookey
    '¯(ツ)/¯'
  end

  belongs_to :classroom
  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
