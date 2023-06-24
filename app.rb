require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts "Books:"
    if books.empty?
      puts "No books available."
    else
      books.each do |book|
        puts "#{book.book_title} by #{book.book_author_name}"
      end
    end
  end

  def list_people
    puts "People:"
    if people.empty?
      puts "No people available."
    else
      people.each do |person|
        puts "#{person.class}: #{person.name} (ID: #{person.id})"
      end
    end
  end

  def create_person
    puts "Enter the person's name:"
    name = gets.chomp

    puts "Enter the person's age:"
    age = gets.chomp.to_i

    puts "Is it a (s)tudent or a (t)eacher?"
    type = gets.chomp.downcase

    case type
    when 's'
      create_student(name, age)
    when 't'
      create_teacher(name, age)
    else
      puts "Invalid choice. Please try again."
    end
  end

  def create_student(name, age)
    puts "Enter the student's classroom label:"
    label = gets.chomp

    classroom = Classroom.new(label)
    student = Student.new(classroom, age, name: name)
    people << student
  end

  def create_teacher(name, age)
    puts "Enter the teacher's specialization:"
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    people << teacher
  end

  def create_book
    puts "Enter the book title:"
    title = gets.chomp

    puts "Enter the book author name:"
    author = gets.chomp

    book = Book.new(title, author)
    books << book
  end

  def create_rental
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i

    person = find_person(person_id)
    if person.nil?
      puts "Person not found."
      return
    end

    puts "Enter the book title:"
    title = gets.chomp

    book = find_book(title)
    if book.nil?
      puts "Book not found."
      return
    end

    puts "Enter the rental date (YYYY-MM-DD):"
    date = gets.chomp

    rental = Rental.new(date, book, person)
    rentals << rental
    puts "Rental created successfully."
  end

  def list_rentals_for_person
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i

    person = find_person(person_id)
    if person.nil?
      puts "Person not found."
      return
    end

    rentals_for_person = rentals.select { |rental| rental.person == person }

    puts "Rentals for #{person.name} (ID: #{person.id}):"
    if rentals_for_person.empty?
      puts "No rentals found."
    else
      rentals_for_person.each do |rental|
        puts "Book: #{rental.book.book_title} | Date: #{rental.date}"
      end
    end
  end

  private

  def find_person(person_id)
    people.find { |person| person.id == person_id }
  end

  def find_book(title)
    books.find { |book| book.book_title == title }
  end
end
