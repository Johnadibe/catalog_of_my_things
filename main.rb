options = {
  '1' => 'List all books',
  '2' => 'List all music albums',
  '3' => 'List all games',
  '4' => 'List all genres',
  '5' => 'List all labels',
  '6' => 'List all authors',
  '7' => 'Add a book',
  '8' => 'Add a music album',
  '9' => 'Add a game',
  '0' => 'Exit App'
}

opt = -1
until opt.zero?
  options.each do |key, val|
    puts "#{key} - #{val}"
  end
  opt = gets.chomp.to_i
end
