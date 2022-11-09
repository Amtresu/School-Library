require_relative 'spec_helper'

describe Student do
  before :each do
    @conor = Student.new(25, true, 'Conor')
  end

  it 'Should be an instance of the Student class' do
    expect(@conor).to be_instance_of Student
  end

  context 'Testing student class instance variables' do
    it 'Conor should be 25' do
      age = @conor.age
      expect(age).to eql 25
    end

    it 'Should be named Conor' do
      name = @conor.name
      expect(name).to eql 'Conor'
    end

    it 'Conor should have his parents permission' do
      permission = @conor.parent_permission
      expect(permission).to be_truthy
    end

    it 'Conor should have the type of student' do
      type = @conor.type
      expect(type).to eql 'Student'
    end

    it 'Conor should not be in a classroom' do
      classroom = @conor.classroom
      expect(classroom).to be_nil
    end
  end

  context 'Testing student methods' do
    it 'Should return ¯(ツ)/¯' do
      service = @conor.play_hookey
      expect(service).to eq '¯(ツ)/¯'
    end
  end
end
