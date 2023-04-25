require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :id, :archived, :genre, :author, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
    @author = nil
  end

  def add_author(author)
    @author = author
  end

  def add_genre(genre)
    genre.add_items << self unless genre.items.include? self
    @genre = genre
  end

  def add_label(label)
    @label.add_items << self unless label.items.include? self
    @label = label
  end

  def can_be_archived?
    return true if (Date.today - Date.parse(@publish_date)).to_i / 365 >= 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
