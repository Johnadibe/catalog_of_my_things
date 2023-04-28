require_relative '../table/book'

describe Book do
  context 'create a book' do
    book = Book.new('Genesis', 'bad', '25-04-2023')

    it 'return name of the publisher' do
      expect(book.publisher).to eq('Genesis')
    end

    it 'return the state of the book' do
      expect(book.cover_state).to eq('bad')
    end

    it 'return publshing  date' do
      expect(book.publish_date).to eq('25-04-2023')
    end
  end
end
