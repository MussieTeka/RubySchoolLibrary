class Book
  attr_accessor :book_title, :book_author_name, :book_rentals

  def initialize(book_title, book_author_name)
    @book_title = book_title
    @book_author_name = book_author_name
    @book_rentals = []
  end

  def create_rental(person, date)
    Rental.new(date, self, person)
  end
end
