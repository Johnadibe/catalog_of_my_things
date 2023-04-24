
class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date

  def initialize(id, genre, author, source, label, publish_date )
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived: boolean
  end

  def can_be_archived?

  end

  def move_to_archive

 end
end
