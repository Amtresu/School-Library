require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Room 205')
  end

  it 'Should be an instance of the Student class' do
    expect(@classroom).to be_instance_of Classroom
  end

  context 'Testing student class instance variables' do
    it 'Should be a room number' do
      room_number = @classroom.label
      expect(room_number).to eql 'Room 205'
    end

    it 'Should have an empty students attribute' do
      students_array = @classroom.students
      expect(students_array).to eql nil
    end
  end
end

