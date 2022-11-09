require_relative 'spec_helper'

describe Rental do
  before :each do
    @conor = Person.new(25, true, 'Conor')
    @book = Book.new('The Hobbit', 'JRR Tolkein')
    @rental = Rental.new(@conor, @book, 1990)
  end

  it 'Should be an instance of the Rental class' do
    expect(@rental).to be_instance_of Rental
  end

  context 'Testing Rental class instance variables' do
    it 'Conor should be the owner of this rental' do
      name = @rental.person
      expect(name).to eql @conor
    end

    it 'The book should be Lord of The Rings' do
      book_name = @rental.book
      expect(book_name).to eql @book
    end

    it 'The book should have been rented in 1990' do
      rental_date = @rental.date
      expect(rental_date).to eql 1990
    end
  end
end
