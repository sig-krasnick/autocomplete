class TrieNode

  attr_accessor :children, :is_end_of_word, :value

  def initialize
    @children = {}
    @is_end_of_word = false
    @value = nil
  end

  def leaf?
    @children.empty?
  end

  def has_children?
    !@children.empty?
  end

end
