require_relative 'spec_helper'

describe Teacher do
  before :each do
    @conor = Teacher.new('Ruby', 25, 'Conor')
  end

  it 'Should be an instance of the Teacher class' do
    expect(@conor).to be_instance_of Teacher
  end

  context 'Testing teacher class instance variables' do
    it 'Conor should specialize in Ruby' do
      subject = @conor.specialization
      expect(subject).to eql 'Ruby'
    end

    it 'Should be named Conor' do
      name = @conor.name
      expect(name).to eql 'Conor'
    end

    it 'Conor should have the age 25' do
      age = @conor.age
      expect(age).to eql 25
    end
    it 'Conor should have the type of Teacher' do
      type = @conor.type
      expect(type).to eql 'Teacher'
    end
  end

  context 'Testing teacher methods' do
    it 'Should return true for age above 18' do
      service = @conor.can_use_services?
      expect(service).to be_truthy
    end
  end
end
