require 'csv'

Rails.application.config.after_initialize do
  $trie = Trie.new
  
  csv_path = Rails.root.join('db', 'words.csv')
  loaded_count = 0
  
  CSV.foreach(csv_path, headers: true) do |row|
    word = row['word']
    popularity = row['popularity']
    
    # Skip rows with missing data
    next if word.nil? || word.strip.empty? || popularity.nil?
    
    $trie.insert(word.strip, { popularity: popularity.to_i })
    loaded_count += 1
  end
  
  Rails.logger.info "Loaded #{loaded_count} words into trie (Trie reports: #{$trie.word_count} words)"
end