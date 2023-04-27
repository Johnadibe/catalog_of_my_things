require './table/inherit/author'
require './table/book'
require './table/game'
require './table/inherit/genre'
require './table/item'
require './table/inherit/label'
require './table/music'
require './loader'
require 'json'

class App
  puts "Welcome to The Content Hub!\n\n"
  def initialize
    @authors = []
    @books = []
    @genres = []
    @labels = []
    @musics = []
    @games = []

    loader = Loader.new
    loader.load_books(@books)
    loader.load_authors(@authors)
    loader.load_genres(@genres)
    loader.load_labels(@labels)
    loader.load_musics(@musics)
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
        puts "Class: #{hash['class']} Cover_state: #{hash['cover_state']}   Publisher: #{hash['publisher']}"
      end
      puts ''
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
      puts 'There are no genres yet'
    else
      @genres.each do |hash|
        puts "Name: #{hash['name']}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'There are no labels yet'
    else
      @labels.each do |hash|
        puts "Title: #{hash['title']}   Color: #{hash['color']}"
      end
    end
  end

  def list_music_albums
    if @musics.empty?
      puts 'There are no musics albums yet'
    else
      @musics.each do |hash|
        puts "On Spotify: #{hash['on_spotify']}"
      end
    end
  end

  def add_label(item)
    print 'Label title: '
    title = gets.chomp
    print 'Label color: '
    color = gets.chomp
    label = Label.new(title, color)
    label.add_item(item)

    label_hash = {
      'id' => label.instance_variable_get('@id'),
      'title' => label.instance_variable_get('@title'),
      'author' => label.instance_variable_get('@color')
    }

    @labels << label_hash
  end

  def add_book
    puts 'Creating book..Add details below.'
    print 'Publish date : '
    publish_date = gets.chomp
    print 'Cover_state (good or bad): '
    cover_state = gets.chomp
    print 'Publisher : '
    publisher = gets.chomp

    book = Book.new(publisher, cover_state, publish_date)
    # Add Label
    add_label(book)
    
    book_hash = {
      'publisher' => book.instance_variable_get('@publisher'),
      'cover_state' => book.instance_variable_get('@cover_state'),
      'publish_date' => book.instance_variable_get('@publish_date'),
      'class' => book.class
    }

    @books << book_hash
    puts 'Book and Label were created successfully'
  end

  def add_genre(item)
    print 'Genre name: '
    name = gets.chomp

    genre = Genre.new(name)
    genre.add_item(item)

    genre_hash = {
      'name' => genre.instance_variable_get('@name')
    }

    @genres << genre_hash
  end

  def add_music
    puts 'Creating Album..Add details below.'
    print 'On Spotify? (true or false) : '
    on_spotify = gets.chomp

    album = Music.new(on_spotify)
    # Add genre
    add_genre(album)

    album_hash = {
      'on_spotify' => album.instance_variable_get('@on_spotify'),
      'publish_date' => album.instance_variable_get('@publish_date')
    }

    @musics << album_hash

    puts 'Music and Genre were created successfully'
  end

  def add_game
    puts 'Creating game..Add details below.'
    print 'Multiplayer? : '
    multipayer = gets.chomp

    print 'Last Played : '
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
    File.write('./data/labels.json', JSON.generate(@labels))
    File.write('./data/games.json', JSON.generate(@games))
    File.write('./data/musics.json', JSON.generate(@musics))
    File.write('./data/genres.json', JSON.generate(@genres))
    puts 'Thank you for using this app!'
    exit
  end
end
