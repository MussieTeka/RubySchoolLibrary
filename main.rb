require_relative 'app'

def display_menu
  puts 'What would you like to do?'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a person'
  puts 'Q. Quit'
end

def perform_action(app, choice)
  actions = {
    '1' => -> { app.list_books },
    '2' => -> { app.list_people },
    '3' => -> { app.create_person },
    '4' => -> { app.create_book },
    '5' => -> { app.create_rental },
    '6' => -> { app.list_rentals_for_person },
    'q' => -> { puts 'Goodbye!' }
  }

  action = actions[choice]
  if action
    action.call
    return true if choice == 'q' # To exit the loop
  else
    puts 'Invalid choice. Please try again.'
  end

  false # Continue the loop
end

def main
  app = App.new

  loop do
    display_menu
    choice = gets.chomp.downcase

    break if perform_action(app, choice)

    puts ''
  end
end

main
