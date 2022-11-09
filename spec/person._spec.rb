require_relative 'spec_helper'

describe Person do
  before :each do
    @conor = Person.new(25, true, 'Conor')
  end

  it 'Should be an instance of the Person class' do
    expect(@conor).to be_instance_of Person
  end

  context 'Testing Person class instance variables' do
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

    context 'testing person class methods' do
      it 'Should return true if Conor can use the services' do
        service = @conor.can_use_services?
        expect(service).to be_truthy
      end

      it 'should return false for age below 18' do
        bob = Person.new(12, true, 'bob')
        service = bob.can_use_services?
        expect(service).to be_falsy
      end

      it 'should allow Conor to rent a book' do
        book = Book.new('LOTR', 'J.R.R Tolkein')
        @conor.add_rentals(book, 1990)
        rental = @conor.rentals.size
        expect(rental).to eql 1
      end
    end
  end
end
