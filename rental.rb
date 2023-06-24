class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.book_rentals << self
    person.person_rentals << self
  end
end
