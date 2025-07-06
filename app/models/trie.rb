class Trie
  def initialize
    @root = TrieNode.new
    @word_count = 0
  end

  def insert(word, value = nil)
    current_node = @root
    
    word.downcase.each_char do |char|
      current_node.children[char] ||= TrieNode.new
      current_node = current_node.children[char]
    end
    
     # Only increment if this is a new word
    unless current_node.is_end_of_word
      @word_count += 1
    end
    
    current_node.is_end_of_word = true
    current_node.value = value
  end

  def word_count
    @word_count
  end

  # Alternative method that counts by traversing the trie
  def total_words
    count_words(@root)
  end

  def count_words(node)
    count = node.is_end_of_word ? 1 : 0
    
    node.children.each do |char, child_node|
      count += count_words(child_node)
    end
    
    count
  end

  def search(word)
    node = find_node(word.downcase)
    node&.is_end_of_word
  end

  def autocomplete(prefix, limit = 10)
    prefix_node = find_node(prefix.downcase)
    return [] unless prefix_node

    results = []
    collect_words(prefix_node, prefix.downcase, results, limit)
    
    # Sort by popularity (highest first)
    results.sort_by { |result| -result[:popularity] }
  end

  private

  def find_node(word)
    current_node = @root
    
    word.each_char do |char|
      return nil unless current_node.children[char]
      current_node = current_node.children[char]
    end
    
    current_node
  end

  def collect_words(node, current_word, results, limit)
    return if results.size >= limit

    if node.is_end_of_word
      results << {
        word: current_word,
        popularity: node.value[:popularity]
      }
    end

    node.children.each do |char, child_node|
      collect_words(child_node, current_word + char, results, limit)
    end
  end
end
