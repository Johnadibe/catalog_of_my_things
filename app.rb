require './table/inherit/author'
require './table/book'
require './table/game'
require './table/inherit/genre'
require './table/item'
require './table/inherit/label'
require './table/music'
require './loader'
require 'json'

class App # rubocop:disable Metrics/ClassLength
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
        print "Class: #{hash['class']}, Game ID : #{hash['game']}, "
        print "Author Name: #{hash['first_name']} #{hash['last_name']}"
        puts ''
      end
      puts ''
    end
  end

  def list_books
    if @books.empty?
      puts 'There are no books yet'
    else
      @books.each do |hash|
        print "Class: #{hash['class']}, Book_id : #{hash['book_id']}, "
        print "Cover_state: #{hash['cover_state']}, Publisher: #{hash['publisher']}"
        puts ''
      end
      puts ''
    end
  end

  def list_games
    if @games.empty?
      puts 'There are no games yet'
    else
      @games.each do |hash|
        print "Class: #{hash['class']}, Game ID : #{hash['game_id']}, "
        print "Multiplayer: #{hash['multiplayer']}, Last Played: #{hash['last_played_at']}"
        puts ''
      end
      puts ''
    end
  end

  def list_genres
    if @genres.empty?
      puts 'There are no genres yet'
    else
      @genres.each do |hash|
        puts "Class: #{hash['class']},  Album_id : #{hash['album']}, Genre: #{hash['name']}"
      end
      puts ''
    end
  end

  def list_labels
    if @labels.empty?
      puts 'There are no labels yet'
    else
      @labels.each do |hash|
        print "Class: #{hash['class']}, Book ID: #{hash['book']}, "
        print "Title: #{hash['title']}, Color: #{hash['color']}"
        puts ''
      end
      puts ''
    end
  end

  def list_music_albums
    if @musics.empty?
      puts 'There are no musics albums yet'
    else
      @musics.each do |hash|
        print "Class: #{hash['class']},  Album_ID : #{hash['album_id']}, "
        print "Publish Date : #{hash['publish_date']}, On Spotify: #{hash['on_spotify']}"
        puts
      end
      puts ''
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
      'color' => label.instance_variable_get('@color'),
      'book' => item.instance_variable_get('@id'),
      'class' => label.class
    }

    @labels << label_hash
    puts 'Label added successfully'
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
    book_hash = {
      'book_id' => book.instance_variable_get('@id'),
      'publisher' => book.instance_variable_get('@publisher'),
      'cover_state' => book.instance_variable_get('@cover_state'),
      'publish_date' => book.instance_variable_get('@publish_date'),
      'class' => book.class
    }
    @books << book_hash

    add_label(book)
    puts 'Book was created successfully'
  end

  def add_genre(item)
    print 'Genre name: '
    name = gets.chomp

    genre = Genre.new(name)
    genre.add_item(item)
    genre_hash = {
      'name' => genre.instance_variable_get('@name'),
      'album' => item.instance_variable_get('@id'),
      'class' => genre.class
    }
    @genres << genre_hash

    puts 'Genre added successfully'
  end

  def add_music_album
    puts 'Creating Album..Add details below.'
    print 'On Spotify? (true or false) : '
    on_spotify = gets.chomp

    album = Music.new(on_spotify)
    album_hash = {
      'album_id' => album.instance_variable_get('@id'),
      'on_spotify' => album.instance_variable_get('@on_spotify'),
      'publish_date' => album.instance_variable_get('@publish_date'),
      'class' => album.class
    }

    @musics << album_hash

    add_genre(album)
    puts 'Music Album was created successfully'
  end

  def add_author(item)
    print('First Name : ')
    first_name = gets.chomp
    print('Last Name : ')
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    author.add_item(item)
    author_hash = {
      'first_name' => author.instance_variable_get('@first_name'),
      'last_name' => author.instance_variable_get('@last_name'),
      'game' => item.instance_variable_get('@id'),
      'class' => author.class
    }
    @authors << author_hash

    puts 'Author added successfully'
  end

  def add_game
    puts 'Creating game..Add details below.'
    print 'Multiplayer? : '
    multipayer = gets.chomp

    print 'Last Played : '
    last_played_at = gets.chomp

    game = Game.new(1)
    game.add_game(multipayer, last_played_at)
    game_hash = {
      'game_id' => game.instance_variable_get('@id'),
      'multiplayer' => game.instance_variable_get('@multiplayer'),
      'last_played_at' => game.instance_variable_get('@last_played_at'),
      'class' => game.class
    }
    @games << game_hash

    add_author(game)
    puts 'Game created successfully'
  end

  # exit function
  def exit_app
    File.write('./data/authors.json', JSON.generate(@authors)) if @authors.size.positive?
    File.write('./data/books.json', JSON.generate(@books)) if @books.size.positive?
    File.write('./data/labels.json', JSON.generate(@labels)) if @labels.size.positive?
    File.write('./data/games.json', JSON.generate(@games)) if @games.size.positive?
    File.write('./data/musics.json', JSON.generate(@musics)) if @musics.size.positive?
    File.write('./data/genres.json', JSON.generate(@genres)) if @genres.size.positive?
    puts 'Thank you for using this app!'
    exit
  end
end
