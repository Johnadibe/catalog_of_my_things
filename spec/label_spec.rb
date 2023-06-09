require './table/inherit/label'

describe Label do
  context 'create a book' do
    label = Label.new('Genesis of Github', 'red')

    it 'return name of the book' do
      expect(label.title).to eq('Genesis of Github')
    end

    it 'return the state of the book' do
      expect(label.color).to eq('red')
    end
  end
end
