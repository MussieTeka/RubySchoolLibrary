require_relative 'app'

def main
  app = App.new

  loop do
    puts "What would you like to do?"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List all rentals for a person"
    puts "Q. Quit"

    choice = gets.chomp.downcase

    case choice
    when '1'
      app.list_books
    when '2'
      app.list_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_rentals_for_person
    when 'q'
      puts "Goodbye!"
      break
    else
      puts "Invalid choice. Please try again."
    end

    puts ""
  end
end

main
