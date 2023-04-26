require './app'

# Ask the user for the choice
class Main
  def menu
    @options = {
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List all games',
      '4' => 'List all genres',
      '5' => 'List all labels',
      '6' => 'List all authors',
      '7' => 'Add a book',
      '8' => 'Add a music album',
      '9' => 'Add a game',
      '0' => 'Exit App'
    }

    @options.each do |index, string|
      puts "#{index} - #{string}"
    end
    gets.chomp.to_i
  end
end

# handle the choices
def choice(user_answer, response)
  actions = {
    1 => :list_books,
    2 => :list_music_albums,
    3 => :list_games,
    4 => :list_genres,
    5 => :list_labels,
    6 => :list_authors,
    7 => :add_book,
    8 => :add_music_album,
    9 => :add_game,
    0 => :exit_app
  }

  action = actions[user_answer]

  response.send(action)
end

def main
  response = App.new

  loop do
    puts 'Please choose an option by entering a number'
    user_answer = Main.new.menu
    choice user_answer, response
  end
end

main
