require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('The Hobbit', 'JRR Tolkein')
  end

  it 'Should be an instance of the Student class' do
    expect(@book).to be_instance_of Book
  end

  context 'Testing Book class instance variables' do
    it 'Should have a title' do
      title = @book.title
      expect(title).to eql 'The Hobbit'
    end

    it 'Should have an author' do
      author = @book.author
      expect(author).to eql 'JRR Tolkein'
    end

    context 'testing book methods' do
      it 'should add a book to a rental' do
        @conor = Person.new(25, true, 'Conor')
        @book.add_rentals(@conor, '1990')
        rentals = @book.rentals.size
        expect(rentals).to eq 1
      end
    end
  end
end
