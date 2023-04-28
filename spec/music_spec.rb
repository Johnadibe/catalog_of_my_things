require_relative '../table/music'
require_relative '../table/item'

describe Music do
  before :each do
    @music = Music.new(true)
  end

  it 'check if the music is on spotify' do
    expect(@music.on_spotify).to eq(true)
  end
end
