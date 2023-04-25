class Author
  attr_accessor :first_name, :last_name

  private

  attr_reader :items
  attr_accessor :id

  public

  def initialize(fname, lname)
    @id = rand(0..100)
    @first_name = fname
    @last_name = lname
    @items = []
  end

  def add_items(item)
    @items.append(item) unless items.include? item
    item.add_author(self)
  end

  def list_authors
    @items.each_with_index do |item, ind|
      puts ind + 1
      puts "Publish date : #{item.publish_date}"
      puts "Author : #{item.author.first_name} #{item.author.last_name}"
      puts ''
    end
  end
end
