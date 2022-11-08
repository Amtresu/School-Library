require './classes/book'
require './classes/app'
require_relative './local_storage'

module ModBook
  include LocalStorage

  def display_books(books)
    if books.length.zero?
      puts 'There are no books'
    else
      books.each_with_index { |book, idx| puts "#{idx}) Book: #{book.title}, Author: #{book.author}" }
    end
    menu_return
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
    book_data = { title: book.title, author: book.author }
    stored_books = fetch_storage('books')
    stored_books.push(book_data)
    update_storage('books', stored_books)
    puts 'Book Successfully Created'
    menu_return
  end
end
