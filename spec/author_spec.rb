require_relative '../table/inherit/author'

describe Author do
  before :each do
    @author = Author.new('Shakir', 'Hussain')
  end

  it 'Checks for Author first name' do
    expect(@author.first_name).to eq('Shakir')
  end

  it 'checks for Author last name' do
    expect(@author.last_name).to eq('Hussain')
  end

  it 'check for Author instance' do
    expect(@author).to be_an_instance_of(Author)
  end
end
