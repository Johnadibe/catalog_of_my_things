class Loader
  def load_authors(authors)
    if File.exist?('./data/authors.json')
      JSON.parse(File.read('./data/authors.json')).each do |author|
        authors << author
      end
    else
      authors = []
    end
  end

  def load_books(books)
    if File.exist?('./data/books.json')
      JSON.parse(File.read('./data/books.json')).each do |book|
        books << book
      end
    else
      books = []
    end
  end

  def load_labels(labels)
    if File.exist?('./data/labels.json')
      JSON.parse(File.read('./data/labels.json')).each do |label|
        labels << label
      end
    else
      labels = []
    end
  end

  def load_games(games)
    if File.exist?('./data/games.json')
      JSON.parse(File.read('./data/games.json')).each do |game|
        games << game
      end
    else
      games = []
    end
  end

  def load_musics(musics)
    if File.exist?('./data/musics.json')
      JSON.parse(File.read('./data/musics.json')).each do |music|
        musics << music
      end
    else
      musics = []
    end
  end

  def load_genres(genres)
    if File.exist?('./data/genres.json')
      JSON.parse(File.read('./data/genres.json')).each do |genre|
        genres << genre
      end
    else
      genres = []
    end
  end
end
