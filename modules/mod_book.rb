require './classes/book'
require './classes/app'

module ModBook
  def list_books(books)
    if books.length.zero?
      puts 'There are no books'
    else
      books.each_with_index { |book, idx| puts "#{idx}) Book: #{book.title}, Author: #{book.author}" }
    end
    back_to_menu
  end

  def create_book(books)
    print 'Enter Book Title: '
    title = gets.chomp
    if title.empty?
      puts 'No title submitted, please try again'
      return(create_book(books))
    end
    print 'Enter Book Author: '
    author = gets.chomp
    if author.empty?
      puts 'No author submitted, please try again'
      return(create_book(books))
    end
    book = Book.new(title, author)
    books.push(book)
    puts 'Book Successfully Created'
    back_to_menu
  end
end
