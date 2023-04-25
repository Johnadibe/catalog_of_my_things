class Loader
    def load_authors(@authors)
      if File.exist?('./data/@authors.json')
        JSON.parse(File.read('./data/@authors.json')).each do |author|
          @authors << author
        end
      else
        @authors = []
      end
    end
  
    def load_books(@books)
      if File.exist?('./data/books.json')
        JSON.parse(File.read('./data/books.json')).each do |book|
          @books << book
        end
      else
        @books = []
      end
    end
  
    def load_games(@games)
      if File.exist?('./data/@games.json')
        JSON.parse(File.read('./data/@games.json')).each do |game|
          @games << game
        end
      else
        @games = []
      end
    end
  end
  