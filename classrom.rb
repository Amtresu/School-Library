require_relative './student'

class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize(label)
    @label = label
    @student = []
  end

  has_many :student

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
