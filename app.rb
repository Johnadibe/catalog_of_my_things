require './author'
require './book'
require './game'
require './genre'
require './item'
require './label'
require './music'
require './loader'
require 'json'

class App
  puts "Welcome to The Content Hub!\n\n"
  def initialize
    @authors = []
    @books = []
    @genres = []
    @labels = []
    @albums = []
    @games = []

    loader = Loader.new
    loader.load_books(@books)
    loader.load_authors(@authors)
    loader.load_genres(@genres)
    loader.load_lables(@labels)
    loader.load_albums(@albums)
    loader.load_games(@games)
  end

  def list_authors
    if @authors.empty?
      puts 'There are no Authors yet'
    else
      @authors.each do |hash|
        puts "Full Name: #{hash['first_name']} #{hash['last_name']} "
      end
    end
  end

  def list_books
    if @books.empty?
      puts 'There are no books yet'
    else
      @books.each do |hash|
        puts "Cover_state: #{hash['cover_state']}   Publisher: #{hash['publisher']}"
      end
    end
  end

  def list_games
    if @games.empty?
      puts 'There are no games yet'
    else
      @games.each do |hash|
        puts "Multiplayer: #{hash['multipayer']}   Last Played: #{hash['last_played_at']}"
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts 'There are no books yet'
    else
      @genres.each do |hash|
        puts "Name: #{hash['name']}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'There are no books yet'
    else
      @labels.each do |hash|
        puts "Title: #{hash['title']}   Color: #{hash['color']}"
      end
    end
  end

  def list_music_albums
    if @albums.empty?
      puts 'There are no books yet'
    else
      @albums.each do |hash|
        puts "On Spotify: #{hash['on_spotify']}"
      end
    end
  end

  def add_book
    puts 'Creating book..Add details below.'
    print 'Publish date: '
    publish_date = gets.chomp
    print 'Cover_state'
    cover_state = gets.chomp
    print 'Publisher'
    publisher = gets.chomp

    book = Book.new(publisher, cover_state, publish_date)
    book_hash = {
      'publisher' => book.instance_variable_get('@publisher'),
      'cover_state' => book.instance_variable_get('@cover_state'),
      'publish_date' => item.instance_variable_get('@publish_date'),
      'class' => book.class
    }

    @books << book_hash
    puts 'Book created successfully'
  end

  def add_music_album
    puts 'Creating Album..Add details below.'
    print 'On Spotify?: '
    on_spotify = gets.chomp

    album = Music.new(on_spotify)
    album_hash = {
      'on_spotify' => album.instance_variable_get('@on_spotify'),
      'publish_date' => item.instance_variable_get('@publish_date')
    }

    @albums << album_hash

    puts 'Album created successfully'
  end

  def add_game
    puts 'Creating game..Add details below.'
    print 'Multiplayer?: '
    multipayer = gets.chomp

    print 'Last Played: '
    last_played_at = gets.chomp

    game = Game.new(multipayer, last_played_at)
    game_hash = {
      'multiplayer' => game.instance_variable_get('@multiplayer'),
      'last_played_at' => game.instance_variable_get('last_played_at')
    }

    @games << game_hash

    puts 'Game created successfully'
  end

  # exit function
  def exit_app
    File.write('./data/authors.json', JSON.generate(@authors))
    File.write('./data/books.json', JSON.generate(@books))
    File.write('./data/games.json', JSON.generate(@games))
    puts 'Thank you for using this app!'
    exit
  end
end
