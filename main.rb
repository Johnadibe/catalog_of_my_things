options = {
  '1' => 'List all books',
  '2' => 'List all music albums',
  '3' => 'List all movies',
  '4' => 'List all games',
  '5' => 'List all genres',
  '6' => 'List all labels',
  '7' => 'List all authors',
  '8' => 'List all sources',
  '9' => 'Add a book',
  '10' => 'Add a music album',
  '11' => 'Add a movie',
  '12' => 'Add a game',
  '0' => 'Exit App'
}

opt = -1
until opt.zero?
  options.each do |key, val|
    puts "#{key} - #{val}"
  end
  opt = gets.chomp.to_i
end
